FactoryBot.define do
  factory :user do
    email { "joseph.doe@test.com" }
    password { "supersecret" }
    name { "Joseph Doe" }
    age { 25 }
    weight { 80 }
    height { 180 }
    id { 1 }

    factory :jane_doe do
      email { "jane.doe@test.com" }
      password { "supersecret123" }
      name { "Jane Doe" }
      age { 30 }
      weight { 60 }
      height { 160 }
      id { 2 }
    end
  end
end