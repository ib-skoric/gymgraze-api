FactoryBot.define do
  factory :exercise do
    name { "MyString" }
    exercise_type { FactoryBot.create(:exercise_type) }
    id { rand(1..99999) }
    user_id { FactoryBot.build(:jane_doe).id }
  end
end
