class Foxynews::PressReleaseSetter
  attr_accessor :data, :paging

  def initialize(data = {}, paging = {})
    @data = data
    @paging = paging
  end

  class << self
    # maps to /v1/pressrooms/:pressroom_id/press_releases.json
    # Note: all parameters must be strings
    def all(includes = nil, order = nil, locales = nil)
      options = {query: {includes: includes, order: order, locales: locales}}


      begin
        press_releases = Foxynews::Parser.data('/press_releases.json', options)
      rescue StandardError => error
        raise GenericError(error.message)
      end

      if press_releases.has_key?('data')
        return Foxynews::PressReleaseSetter.new(
          press_releases['data'].each_with_object(data = []) {|pr| data << Foxynews::PressRelease.new(pr) },
          Foxynews::Paging.new(press_releases['paging'])
        )
      else
        return false
      end
    end

    # maps to /v1/pressrooms/:pressroom_id/press_releases/:id.json
    def find(id, includes = nil)
      options = {query: {includes: includes}}

      begin
        press_release = Foxynews::Parser.data("/press_releases/#{id}.json", options)
      rescue StandardError => error
        raise GenericError(error.message)
      end

      if press_release.has_key?('data')
        # return the hash in open struct to allow for @press_release.body_html calls
        return Foxynews::PressRelease.new(press_release['data'])
      else
        return false
      end
    end

  end

end




