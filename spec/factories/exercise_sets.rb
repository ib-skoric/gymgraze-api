FactoryBot.define do
  factory :exercise_set do
    reps { rand(1..99999) }
    weight { "9.99" }
    exercise { FactoryBot.create(:exercise) }
  end
end
