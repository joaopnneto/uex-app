FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_cpf }
    phone { Faker::PhoneNumber.phone_number }
    association :user
  end
end
