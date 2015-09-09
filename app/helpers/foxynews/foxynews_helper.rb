module Foxynews::FoxynewsHelper
  def to_slug(title)
    title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end
