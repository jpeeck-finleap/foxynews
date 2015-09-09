class Foxynews::PressroomSetter
  attr_accessor :data, :paging

  def initialize(data = [], paging = [])
    @data = data
    @paging = paging
  end


  class << self
    # maps to /v1/pressrooms/:id.json
    def my_pressroom
      begin
        pressroom = Foxynews::Parser.data('.json')
      rescue
        raise
      else
        return (pressroom.has_key?('data')) ? Foxynews::Pressroom.new(pressroom['data']) : false
      end
    end

    # maps to /v1/pressrooms/:id/timeline.json
    def timeline(page = 1, limit = 30)
      options = {query: {page: page, limit: limit}}


      begin
        timeline = Foxynews::Parser.data('/timeline.json', options)
      rescue
        raise
      else
        if timeline.has_key?('data')
          grouped_by_month = timeline['data'].group_by { |t| Date.parse(t['release_date']).strftime('%B %Y') }

          grouped_by_month.each do |month, content|
            content.map! do |i|
              if i['type'] == 'clipping'
                Foxynews::Clipping.new(i)
              else
                Foxynews::PressRelease.new(i)
              end
            end
          end

          return Foxynews::PressroomSetter.new(grouped_by_month, Foxynews::Paging.new(timeline['paging']))
        else
          return false
        end
      end
    end

    # maps to /v1/pressrooms/:id/search.json
    def search(query, locale = nil)
    end
  end


end
