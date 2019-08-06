FactoryBot.define do
  factory :rent do
    user { build(:user) }
    book { build(:book) }
    rent_in { DateTime.now.to_date }
    rent_out { rent_in + 10.days }
  end
end
