FactoryBot.define do
  factory :workout_diary_entry do
    # set date to random day from today
    date { Date.today + rand(1..99999) }
    user { FactoryBot.build(:jane_doe) }
  end
end
