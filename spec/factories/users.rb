# frozen_string_literal: true

FactoryBot.define do
	factory :user do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		password { 'pass_123' }
		password_confirmation { 'pass_123' }
	end
end
