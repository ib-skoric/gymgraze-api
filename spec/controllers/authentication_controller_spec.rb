require 'rails_helper'
require 'spec_helper'

describe AuthenticationController, type: :controller do
  describe "POST to /authenticate endpoint" do
    let (:user) { FactoryBot.create(:user) }

    it "will authenticate the user" do
      post 'create', params: { email: user.email, password: user.password }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
        "token" => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozfQ.37znViEM3edi-7j_eUifNbjuIaljfOs0FqpY87oGCf0'
      })
    end

    it "checks if email is missing and returns an error" do
      post 'create', params: { password: 'test'}

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        "error" => "param is missing or the value is empty: email"
      })
    end

    it "checks if password is missing and returns an error" do
      post 'create', params: { email: 'abcd'}

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        "error" => "param is missing or the value is empty: password"
      })
    end

    it "validates the current password is correct for the user" do
      post 'create', params: { email: user.email, password: 'wrongpassword'}

      expect(response).to have_http_status(:unauthorized)
    end
  end
  end