class AddWebtoonFieldsToComics < ActiveRecord::Migration[8.0]
  def change
    add_column :comics, :day_of_week, :string
    add_column :comics, :genre, :string
    add_column :comics, :thumbnail_url, :string
    add_column :comics, :is_new, :boolean, default: false
    add_column :comics, :status, :string, default: 'ongoing'
    add_column :comics, :rating, :decimal, precision: 3, scale: 2, default: 0.0
    add_column :comics, :view_count, :integer, default: 0
    
    # 기존 데이터에 기본값 설정
    reversible do |dir|
      dir.up do
        Comic.update_all(day_of_week: '월')
      end
    end
    
    # 이후 NOT NULL 제약조건 추가
    change_column_null :comics, :day_of_week, false
    
    add_index :comics, :day_of_week
    add_index :comics, :genre
    add_index :comics, :status
  end
end
