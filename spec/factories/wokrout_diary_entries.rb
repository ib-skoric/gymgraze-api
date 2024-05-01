FactoryBot.define do
  factory :workout_diary_entry do
    date { "2024-02-22" }
    user { FactoryBot.build(:jane_doe) }
  end
end
