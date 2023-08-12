FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    cpf { Faker::CPF.number }
    phone { Faker::PhoneNumber.phone_number }
    association :user
  end
end
