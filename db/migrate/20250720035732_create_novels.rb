class CreateNovels < ActiveRecord::Migration[8.0]
  def change
    create_table :novels do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.text :description
      t.string :genre, null: false
      t.string :thumbnail_url
      t.decimal :rating, precision: 3, scale: 2, default: 0.0
      t.integer :view_count, default: 0
      t.string :status, default: 'ongoing'
      t.boolean :is_new, default: false
      t.string :category, default: 'novel'
      t.integer :chapter_count, default: 0
      t.string :update_day

      t.timestamps
    end
    
    add_index :novels, :genre
    add_index :novels, :status
    add_index :novels, :category
    add_index :novels, :rating
  end
end
