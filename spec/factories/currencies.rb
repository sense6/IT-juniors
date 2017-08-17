FactoryGirl.define do
  factory :currency do
    symbol "E"
    short_name "EUR"

    trait :usd do
      symbol "$"
      short_name "usd"
    end
  end
end
