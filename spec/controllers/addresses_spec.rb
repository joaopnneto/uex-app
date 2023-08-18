# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  describe 'GET search_address' do
    user = FactoryBot.create(:user)
    let(:valid_cep) { { cep: '81230-220' } }
    let(:invalid_cep) { { cep: '12312-123' } }

    before do
      login_as user
    end

    context 'success' do
      it 'fetch address information from api with coordinates' do
        get :search_address, params: valid_cep, as: :json

        full_address = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(full_address['logradouro']).to be_present
        expect(full_address['bairro']).to be_present
        expect(full_address['localidade']).to be_present
        expect(full_address['uf']).to be_present
        expect(full_address['ibge']).to be_present
        expect(full_address['ddd']).to be_present
        expect(full_address['lat']).to be_present
        expect(full_address['lng']).to be_present
      end
    end
  end
end
