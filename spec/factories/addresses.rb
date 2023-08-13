# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    uf { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip_code }
    association :contact
  end
end
