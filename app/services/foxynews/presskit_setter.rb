class Foxynews::PresskitSetter
  attr_accessor :data, :paging

  def initialize(data, paging)
    @data = data
    @paging = paging
  end

  class << self
    #maps to /v1/pressrooms/:pressroom_id/presskits.json
    def all(page = 1, limit = 30)
      options = {query: {page: page, limit: limit}}

      begin
        presskits = Foxynews::Parser.data('/presskits.json', options)
      rescue StandardError => error
        raise GenericError(error.message)
      end

      if presskits.has_key?('data')
        return Foxynews::PresskitSetter.new(
          presskits['data'].each_with_object(data = []) {|pk| data << Foxynews::Presskit.new(pk) },
          Foxynews::Paging.new(presskits['paging'])
        )
      else
        return false
      end
    end

    #maps to /v1/pressrooms/:pressroom_id/presskits/:id.json
    def find(id)
      begin
        presskit = Foxynews::Parser.data("/presskits/#{id}.json")
      rescue StandardError => error
        raise GenericError(error.message)
      end

      if presskit.has_key?('data')
        return Foxynews::Presskit.new(presskit['data'])
      else
        return false
      end
    end

  end

end
