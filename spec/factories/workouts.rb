FactoryBot.define do
  factory :workout do
    id { 1 }
    date { "2024-02-25" }
    workout_diary_entry { FactoryBot.build(:workout_diary_entry) }
  end
end
