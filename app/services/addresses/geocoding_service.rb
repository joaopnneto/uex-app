class Addresses::GeocodingService < ApplicationService
  def initialize(params)
    @address = params
  end

  def call
    response = ::GeocodingApi.new(@address).search
    build_location(response.body)
  end

  private

  def build_location(params)
    JSON.parse(params)['results'][0]['geometry']['location']
  end
end
