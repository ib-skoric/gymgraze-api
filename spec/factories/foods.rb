FactoryBot.define do
  factory :food do
    name { "MyString" }
    barcode { 1 }
    entered_at { "2024-01-17 08:18:42" }
    meal { nil }
  end
end
