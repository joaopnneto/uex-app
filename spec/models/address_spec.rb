# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is valid' do
    address = FactoryBot.build(:address)
    expect(address).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:uf) }
    it { is_expected.to validate_presence_of(:zip_code) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:contact) }
    it { is_expected.to have_one(:coordinate) }
  end
end
