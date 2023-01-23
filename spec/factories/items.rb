FactoryBot.define do
  factory :item do
    name {Faker::Commerce.name}
    context {Faker::Lorem.paragraph}
    
    category_id {Faker::Number.between(from: 0, to: 9)}
    state_id {Faker::Number.between(from: 0, to: 6)}
    shipping_id {Faker::Number.between(from: 0, to: 2)}
    area_id {Faker::Number.between(from: 0, to: 48)}
    scheduled_id {Faker::Number.between(from: 0, to: 3)}

    price {Faker::Number.between(from: 300, to: 9999999)}
  end
end
