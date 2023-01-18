FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    surname {person.first.kanji}
    name {person.first.kanji}
    surnamek {person.first.katakana}
    namek {person.last.katakana}
    birthday {Faker::Date.backward}
  end
end
