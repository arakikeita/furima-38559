FactoryBot.define do
  factory :buy_address do
    post {Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4)}
    area_id {Faker::Number.between(from: 2, to: 49)}
    city {Faker::Address.city}
    num {Faker::Address.street_address}
    building { Faker::Address.street_address }
    telephone {Faker::Number.decimal_part(digits: 11)}
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
