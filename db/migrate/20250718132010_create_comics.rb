class CreateComics < ActiveRecord::Migration[8.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :author
      t.text :description

      t.timestamps
    end
  end
end
