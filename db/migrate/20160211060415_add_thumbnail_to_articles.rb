class AddThumbnailToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :thumbnail, :text
  end
end
