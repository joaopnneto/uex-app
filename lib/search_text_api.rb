class SearchTextApi
  SEARCHTEXT = ENV['GOOGLE_MAPS_TEXT_API']
  GEOCODING_KEY = ENV['GOOGLE_MAPS_KEY']

  def initialize(params)
    @address = params
  end

  def search
    Faraday.get("#{SEARCHTEXT}#{@address}&key=#{GEOCODING_KEY}", nil, headers)
  end

  private

  def headers
    {
      'Content-Type' => 'application/json'
    }
  end
end
