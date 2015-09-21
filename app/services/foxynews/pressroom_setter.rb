class Foxynews::PressroomSetter
  attr_accessor :data, :paging

  def initialize(data = [], paging = [])
    @data = data
    @paging = paging
  end


  def filter_timeline_by_language!(language)
    data.each_with_object(localized = {}) do |month|
      month.last.each do |item|
        if item.language.include? language
          if localized.has_key? month.first
            localized[month.first] << item
          else
            localized[month.first] = [item]
          end
        end
      end
    end

    self.data = localized
  end

  class << self
    # maps to /v1/pressrooms/:id.json
    def pressroom
      begin
        pressroom = Foxynews::Parser.data('.json')
      rescue StandardError => error
        raise GenericError(error.message)
      end

      return (pressroom.has_key?('data')) ? Foxynews::Pressroom.new(pressroom['data']) : false

    end

    # maps to /v1/pressrooms/:id/timeline.json
    def timeline(pagination_options = {})
      options = {query: pagination_options}


      begin
        timeline = Foxynews::Parser.data('/timeline.json', options)
      rescue StandardError => error
        raise GenericError(error.message)
      end

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

    # maps to /v1/pressrooms/:id/search.json
    def search(query, locale = nil)
    end

  end

end
