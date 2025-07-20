require 'digest'

class User < ApplicationRecord
  # 비밀번호 가상 속성
  attr_accessor :password, :password_confirmation
  
  # 유효성 검증
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?
  validate :passwords_match, if: :password_required?
  validates :phone, format: { with: /\A[\d\-\s\+\(\)]+\z/, message: "올바른 전화번호 형식이 아닙니다" }, allow_blank: true
  validates :gender, inclusion: { in: %w[male female other], message: "올바른 성별을 선택해주세요" }, allow_blank: true
  
  # 비밀번호 저장 전 암호화
  before_save :encrypt_password, if: :password_required?
  
  # 비밀번호 인증 메서드
  def authenticate(password)
    return false unless password_digest.present?
    Digest::SHA256.hexdigest(password + salt) == password_digest
  end
  
  # 나이 계산 메서드
  def age
    return nil unless birth_date
    ((Date.current - birth_date) / 365.25).floor
  end
  
  # 프로필 이미지 URL (기본값 제공)
  def avatar_url
    profile_image.presence || "https://ui-avatars.com/api/?name=#{CGI.escape(name)}&background=6366f1&color=fff"
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
end
