require 'foxynews/engine'

module Foxynews
  mattr_accessor :base_uri
  @@base_uri = ''

  def self.setup
    yield self
  end
end
