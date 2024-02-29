FactoryBot.define do
  factory :exercise_set do
    reps { 1 }
    weight { "9.99" }
    exercise { FactoryBot.create(:exercise) }
  end
end
