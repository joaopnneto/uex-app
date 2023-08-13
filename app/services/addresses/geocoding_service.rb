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
    response = JSON.parse(params)
    return response if response['status'].include?('ZERO_RESULTS')

    response['results'][0]['geometry']['location']
  end
end
