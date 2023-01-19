FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password { Faker::Lorem.characters(number: 8, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    surname {person.first.kanji}
    name {person.last.kanji}
    surnamek {person.first.katakana}
    namek {person.last.katakana}
    birthday {Faker::Date.backward}
  end
end
