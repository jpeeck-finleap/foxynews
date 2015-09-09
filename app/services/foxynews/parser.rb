require 'httparty'

class Foxynews::Parser
  include HTTParty

  base_uri Foxynews.base_uri

  class << self
    def data(end_of_path = '', options = {})
      if Rails.env.test?

        end_of_path.gsub!('/', '_')
        begin
          file = File.read("../dummy_responses/pressrooms_id#{end_of_path}")
        rescue
          return {}
        else
          return JSON.parse file
        end
      else
        http_obj = get(end_of_path, options)
        return http_obj
      end
    end
  end


end
