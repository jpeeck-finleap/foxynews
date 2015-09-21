class ChangeArticleToArticleId < ActiveRecord::Migration
  def change
    rename_column :foxynews_featured_items, :article, :article_id
  end
end
