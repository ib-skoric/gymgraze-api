FactoryBot.define do
  factory :user do
    username { "joseph.doe" }
    password { "supersecret" }
    id { 1 }

    factory :jane_doe do
      username { "jane.doe" }
      password { "supersecret123" }
      id { 2 }
    end
  end
end