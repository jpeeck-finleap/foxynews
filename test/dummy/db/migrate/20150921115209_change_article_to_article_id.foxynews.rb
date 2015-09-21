# This migration comes from foxynews (originally 20150921110000)
class ChangeArticleToArticleId < ActiveRecord::Migration
  def change
    rename_column :foxynews_featured_items, :article, :article_id
  end
end
