require 'rails_helper'
require 'spec_helper'

describe UserController do
describe "GET to /users/:id endpoint" do
    let (:user) { FactoryBot.create(:user, username: "testing", password: "testing2313543435", id: 4) }

    it "returns the user whose token we passed in" do
      request.headers.merge!({'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0fQ.Xv7yOoWo5RkZ6CJAfAkSKzeWA6ap9vjFIYr0FM2uq_k" })
      get "index", params: { id: user.id }

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ user_id: user.id }.to_json)
    end
  end
end