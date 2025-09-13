class MigrateExistingUserDataToProfiles < ActiveRecord::Migration[8.0]
  def up
    # 기존 사용자들의 데이터를 UserProfile로 마이그레이션
    User.find_each do |user|
      next if user.user_profiles.exists?
      
      user.user_profiles.create!(
        name: user.read_attribute(:name) || user.email.split('@').first,
        nickname: user.read_attribute(:nickname) || user.email.split('@').first,
        phone: user.read_attribute(:phone),
        birth_date: user.read_attribute(:birth_date),
        gender: user.read_attribute(:gender),
        profile_image: user.read_attribute(:profile_image),
        bio: user.read_attribute(:bio),
        version: 1,
        is_current: true,
        change_reason: "기존 데이터 마이그레이션",
        changed_by: 'system'
      )
    end
  end
  
  def down
    UserProfile.delete_all
  end
end