class AddCategoryToComics < ActiveRecord::Migration[8.0]
  def change
    add_column :comics, :category, :string, default: 'webtoon'
    add_index :comics, :category
  end
end
