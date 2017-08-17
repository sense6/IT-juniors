FactoryGirl.define do
  factory :company do
    name { FFaker::Lorem.word.capitalize }
    description { FFaker::Lorem.paragraph }
    phone { FFaker::PhoneNumber.phone_number }
    address { FFaker::Address.street_address }
    web_page { FFaker::Internet.http_url }
    nip nil
    krs nil
  end
end
