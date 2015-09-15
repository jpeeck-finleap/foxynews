class CreateFoxynewsFeaturedItems < ActiveRecord::Migration
  def change
    create_table :foxynews_featured_items do |t|
      t.string :title
      t.integer :article
      t.boolean :featured
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :foxynews_featured_items, :title
    add_index :foxynews_featured_items, :article
  end
end
