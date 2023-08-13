# frozen_string_literal: true

FactoryBot.define do
  factory :coordinate do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    association :address
  end
end
