class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :phone, :string
    add_column :users, :birth_date, :date
    add_column :users, :gender, :string
    add_column :users, :profile_image, :string
    add_column :users, :bio, :text
  end
end
