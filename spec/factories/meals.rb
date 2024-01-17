FactoryBot.define do
  factory :meal do
    name { "Breakfast" }
    user { FactoryBot.create(:user) }
  end
end
