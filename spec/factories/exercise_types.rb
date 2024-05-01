FactoryBot.define do
  factory :exercise_type do
    id { 1 }
    name { "MyString" }
    exercise_category { "strength" }
    user_id { FactoryBot.build(:jane_doe).id }
  end
end
