# frozen_string_literal: true

class AdressesController < ApplicationController
  def search_address
    result = ::Addresses::SearchService.new(params['cep']).call
    return render json: result, status: :ok if result[:status].eql? 200

    render json: { error: 'Endereço não encontrado' }, status: :unprocessable_entity
  end
end
