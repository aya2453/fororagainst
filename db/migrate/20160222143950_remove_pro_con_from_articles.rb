class RemoveProConFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :pros_count, :integer
    remove_column :articles, :cons_count, :integer
  end
end
