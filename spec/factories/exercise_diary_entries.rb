FactoryBot.define do
  factory :exercise_diary_entry do
    date { "2024-02-22" }
    user { nil }
    calories_burned { 1 }
  end
end
