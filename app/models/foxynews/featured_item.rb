class Foxynews::FeaturedItem < ActiveRecord::Base

  validates :article, presence: true
  validates :title, presence: true
end
