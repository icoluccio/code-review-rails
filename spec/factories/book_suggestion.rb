FactoryBot.define do
  factory :book_suggestion do
    synopsis { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(as_string: true) }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::Internet.url }
    editor { Faker::Book.publisher }
    year { Faker::Number.within(range: 0..2019) }
    user { build(:user) }
  end
end
