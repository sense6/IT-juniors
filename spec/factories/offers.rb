FactoryGirl.define do
  factory :offer do
    title { FFaker::Lorem.phrase.capitalize }
    description { FFaker::Lorem.paragraph }
    location { FFaker::Address.street_address }
    salary_min 0
    salary_max 10000
    role
    company
    currency
  end
end
