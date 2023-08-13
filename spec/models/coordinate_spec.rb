# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coordinate, type: :model do
  it 'is valid' do
    coordinate = FactoryBot.build(:coordinate)
    expect(coordinate).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:address) }
  end
end
