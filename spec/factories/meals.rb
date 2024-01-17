FactoryBot.define do
  factory :breakfast do
    name { "Breakfast" }
    user { User.find_by(id: 1) }
  end
end
