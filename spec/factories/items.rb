FactoryBot.define do
  factory :item do
    association :user

    name {Faker::Name.name}
    content {Faker::Lorem.paragraph}
    
    category_id {Faker::Number.between(from: 1, to: 9)}
    state_id {Faker::Number.between(from: 1, to: 6)}
    shipping_id {Faker::Number.between(from: 1, to: 2)}
    area_id {Faker::Number.between(from: 1, to: 48)}
    scheduled_day_id {Faker::Number.between(from: 1, to: 3)}

    price {Faker::Number.between(from: 300, to: 9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
