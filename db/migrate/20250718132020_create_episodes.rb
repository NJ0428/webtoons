class CreateEpisodes < ActiveRecord::Migration[8.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :episode_number
      t.references :comic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
