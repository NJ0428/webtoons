class CreateUserProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :nickname, null: false
      t.string :phone
      t.date :birth_date
      t.string :gender
      t.string :profile_image
      t.text :bio
      t.integer :version, null: false, default: 1
      t.boolean :is_current, null: false, default: false
      t.text :change_reason # 변경 사유
      t.string :changed_by # 변경자 (시스템/사용자)

      t.timestamps
    end
    
    add_index :user_profiles, [:user_id, :version], unique: true
    add_index :user_profiles, [:user_id, :is_current]
  end
end
