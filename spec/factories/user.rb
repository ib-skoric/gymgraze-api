FactoryBot.define do
  factory :user do
    email { "joseph.doe@test.com" }
    password { "supersecret" }
    name { "Joseph Doe" }
    age { 25 }
    weight { 80 }
    id { 1 }

    factory :jane_doe do
      email { "jane.doe@test.com" }
      password { "supersecret123" }
      name { "Jane Doe" }
      age { 30 }
      weight { 60 }
      id { 2 }
    end
  end
end