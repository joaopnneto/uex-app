require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST sign_in' do
    user = FactoryBot.create(:user)
    context 'when valid' do
      it 'sign in user' do
        login_as user

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
