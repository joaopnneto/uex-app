class ViacepApi
  VIACEP_API = ENV['VIACEP']

  def initialize(params)
    @params = params
  end

  def search
    Faraday.get("#{VIACEP_API}/#{@params}/json/", nil, headers)
  end

  private

  def headers
    {
      'Content-Type' => 'application/json'
    }
  end
end
