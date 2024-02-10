require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe UserController do
describe "GET to /users/:id endpoint" do
    let (:user) { FactoryBot.create(:user, email: "testing", password: "testing2313543435", id: 4) }

    it "returns the user whose token we passed in" do
      request.headers.merge!(authentication_helper(user))
      get "index", params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end
end

  describe "POST to /users endpoint" do
    it "creates a new user" do
      post 'create', params: { user: { email: "testing", password: "testing2313543435", name: "Tester", age: 35, weight: 80, height: 170 } }

      expect(response).to have_http_status(:created)
    end
  end
end