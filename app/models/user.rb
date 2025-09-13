require 'digest'

class User < ApplicationRecord
  # 연관관계
  has_many :user_profiles, dependent: :destroy
  
  # 비밀번호 가상 속성
  attr_accessor :password, :password_confirmation
  
  # 유효성 검증
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?
  validate :passwords_match, if: :password_required?
  
  # 비밀번호 저장 전 암호화
  before_save :encrypt_password, if: :password_required?
  
  # 비밀번호 인증 메서드
  def authenticate(password)
    return false unless password_digest.present?
    Digest::SHA256.hexdigest(password + salt) == password_digest
  end
  
  # 현재 프로필 반환
  def current_profile
    user_profiles.current.first || create_initial_profile
  end
  
  # 프로필 업데이트 (새 버전 생성)
  def update_profile(attributes, change_reason: nil, changed_by: 'user')
    new_profile = user_profiles.build(
      name: attributes[:name] || current_profile&.name,
      nickname: attributes[:nickname] || current_profile&.nickname,
      phone: attributes[:phone] || current_profile&.phone,
      birth_date: attributes[:birth_date] || current_profile&.birth_date,
      gender: attributes[:gender] || current_profile&.gender,
      profile_image: attributes[:profile_image] || current_profile&.profile_image,
      bio: attributes[:bio] || current_profile&.bio,
      change_reason: change_reason,
      changed_by: changed_by
    )
    
    # 닉네임 중복 검사 (다른 사용자의 현재 프로필과 비교)
    if attributes[:nickname] && User.joins(:user_profiles)
                                   .where(user_profiles: { is_current: true, nickname: attributes[:nickname] })
                                   .where.not(id: id).exists?
      new_profile.errors.add(:nickname, "이미 사용 중인 닉네임입니다")
      return new_profile
    end
    
    new_profile.save
    new_profile
  end
  
  # 프로필 히스토리 반환
  def profile_history
    user_profiles.ordered_by_version
  end
  
  # 특정 버전의 프로필 반환
  def profile_version(version)
    user_profiles.by_version(version).first
  end
  
  # 프로필 롤백
  def rollback_profile_to(version, change_reason: nil)
    target_profile = profile_version(version)
    return nil unless target_profile
    
    update_profile(
      {
        name: target_profile.name,
        nickname: target_profile.nickname,
        phone: target_profile.phone,
        birth_date: target_profile.birth_date,
        gender: target_profile.gender,
        profile_image: target_profile.profile_image,
        bio: target_profile.bio
      },
      change_reason: change_reason || "버전 #{version}으로 롤백",
      changed_by: 'system'
    )
  end
  
  # 레거시 메서드들 (현재 프로필 기반)
  def name
    current_profile&.name
  end
  
  def nickname
    current_profile&.nickname
  end
  
  def phone
    current_profile&.phone
  end
  
  def birth_date
    current_profile&.birth_date
  end
  
  def gender
    current_profile&.gender
  end
  
  def profile_image
    current_profile&.profile_image
  end
  
  def bio
    current_profile&.bio
  end
  
  def age
    current_profile&.age
  end
  
  def avatar_url
    current_profile&.avatar_url || "https://ui-avatars.com/api/?name=#{CGI.escape(email)}&background=6366f1&color=fff"
  end
  
  private
  
  # 비밀번호가 필요한지 확인
  def password_required?
    password.present?
  end
  
  # 비밀번호 일치 확인
  def passwords_match
    return unless password.present? && password_confirmation.present?
    errors.add(:password_confirmation, "비밀번호가 일치하지 않습니다") if password != password_confirmation
  end
  
  # 비밀번호 암호화
  def encrypt_password
    return unless password.present?
    
    # 솔트 생성 (없을 경우에만)
    self.salt = generate_salt if salt.blank?
    
    # 비밀번호 해시화
    self.password_digest = Digest::SHA256.hexdigest(password + salt)
  end
  
  # 랜덤 솔트 생성
  def generate_salt
    SecureRandom.hex(16)
  end
  
  # 초기 프로필 생성 (기존 데이터에서)
  def create_initial_profile
    return nil if user_profiles.exists?
    
    user_profiles.create!(
      name: read_attribute(:name) || email.split('@').first,
      nickname: read_attribute(:nickname) || email.split('@').first,
      phone: read_attribute(:phone),
      birth_date: read_attribute(:birth_date),
      gender: read_attribute(:gender),
      profile_image: read_attribute(:profile_image),
      bio: read_attribute(:bio),
      change_reason: "초기 프로필 생성",
      changed_by: 'system'
    )
  end
end
