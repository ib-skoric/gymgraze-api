FactoryBot.define do
  factory :goal do
    steps { 1 }
    kcal { 1 }
    exercise { 1 }
    user { FactoryBot.build(:jane_doe) }
    id { 1 }
  end
end
