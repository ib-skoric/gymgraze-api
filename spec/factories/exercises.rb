FactoryBot.define do
  factory :exercise do
    name { "MyString" }
    exercise_type { "strength" }
    id { 1 }
    user_id { FactoryBot.create(:jane_doe).id }
  end
end
