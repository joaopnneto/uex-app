class AddressesController < ApplicationController
  def search_address
    result = ::Addresses::SearchService.new(params['cep']).call
    return render json: build_response(result, build_coordinate(result[:body])), status: :ok if result[:status].eql? 200

    render json: { error: I18n.t('activerecord.errors.not_found') }, status: :unprocessable_entity
  end

  def search_text
    response = ::Addresses::SearchTextService.new(params['address']).call
    render json: response
  end

  private

  def build_coordinate(params)
    ::Addresses::GeocodingService.new(concat_address(params)).call
  end

  def concat_address(address)
    "#{address['uf']} #{address['localidade']} #{address['logradouro']}"
  end

  def build_response(address, coordinates)
    address[:body].merge(coordinates)
  end
end
