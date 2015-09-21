class Foxynews::FeaturedItem < ActiveRecord::Base

  validates :article_id, :title, presence: true
end
