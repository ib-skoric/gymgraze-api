require 'rails_helper'
require 'spec_helper'

describe AuthenticationController, type: :controller do
  describe "POST to /authenticate endpoint" do
    it "will authenticate the user" do
      post 'create', params: { username: 'john.doe', password: 'test' }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
        "token" => 'abc123'
      })
    end

    it "checks if username is missing and returns an error" do
      post 'create', params: { password: 'test'}

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        "error" => "param is missing or the value is empty: username"
      })
    end

    it "checks if password is missing and returns an error" do
      post 'create', params: { username: 'abcd'}

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        "error" => "param is missing or the value is empty: password"
      })
    end
  end

end