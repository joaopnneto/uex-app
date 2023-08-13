class GeocodingApi
  GEOCODING = ENV['GOOGLE_MAPS_API']
  GEOCODING_KEY = ENV['GOOGLE_MAPS_KEY']

  def initialize(params)
    @address = params
  end

  def search
    Faraday.get("#{GEOCODING}#{@address}&key=#{GEOCODING_KEY}", nil, headers)
  end

  private

  def headers
    {
      'Content-Type' => 'application/json'
    }
  end
end
