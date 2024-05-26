FactoryBot.define do
  factory :exercise_type do
    id { rand(1..99999) }
    name { "MyString" }
    exercise_category { "strength" }
    user_id { FactoryBot.build(:jane_doe).id }
  end
end
