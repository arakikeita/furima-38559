FactoryBot.define do
  factory :item do
    association :user
    

    name {Faker::Name.name}
    content {Faker::Lorem.paragraph}
    
    category_id {Faker::Number.between(from: 2, to: 10)}
    state_id {Faker::Number.between(from: 2, to: 7)}
    shipping_id {Faker::Number.between(from: 2, to: 3)}
    area_id {Faker::Number.between(from: 2, to: 49)}
    scheduled_day_id {Faker::Number.between(from: 2, to: 4)}

    price {Faker::Number.between(from: 300, to: 9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
