FactoryBot.define do
  factory :meal do
    name { "Breakfast" }
    user { FactoryBot.build(:user) }
  end
end
