class UserProfile < ApplicationRecord
  belongs_to :user
  
  # 유효성 검증
  validates :name, presence: true
  validates :nickname, presence: true
  validates :version, presence: true, uniqueness: { scope: :user_id }
  validates :phone, format: { with: /\A[\d\-\s\+\(\)]+\z/, message: "올바른 전화번호 형식이 아닙니다" }, allow_blank: true
  validates :gender, inclusion: { in: %w[male female other], message: "올바른 성별을 선택해주세요" }, allow_blank: true
  
  # 스코프
  scope :current, -> { where(is_current: true) }
  scope :by_version, ->(version) { where(version: version) }
  scope :ordered_by_version, -> { order(:version) }
  
  # 콜백
  before_create :set_version_number
  after_create :update_current_profile
  
  # 나이 계산 메서드
  def age
    return nil unless birth_date
    ((Date.current - birth_date) / 365.25).floor
  end
  
  # 프로필 이미지 URL (기본값 제공)
  def avatar_url
    profile_image.presence || "https://ui-avatars.com/api/?name=#{CGI.escape(name)}&background=6366f1&color=fff"
  end
  
  # 이전 버전과의 차이점 반환
  def changes_from_previous
    previous_profile = user.user_profiles.where('version < ?', version).order(:version).last
    return {} unless previous_profile
    
    changes = {}
    %w[name nickname phone birth_date gender profile_image bio].each do |attr|
      old_value = previous_profile.send(attr)
      new_value = self.send(attr)
      changes[attr] = { from: old_value, to: new_value } if old_value != new_value
    end
    changes
  end
  
  private
  
  # 버전 번호 설정
  def set_version_number
    return if version.present?
    
    last_version = user.user_profiles.maximum(:version) || 0
    self.version = last_version + 1
  end
  
  # 현재 프로필 업데이트
  def update_current_profile
    # 기존 현재 프로필들을 false로 변경
    user.user_profiles.where.not(id: id).update_all(is_current: false)
    # 새로운 프로필을 현재로 설정
    update_column(:is_current, true)
  end
end
