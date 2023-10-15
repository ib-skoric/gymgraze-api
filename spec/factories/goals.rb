FactoryBot.define do
  factory :goal do
    steps { 1 }
    kcal { 1 }
    excercise { 1 }
    user { nil }
  end
end
