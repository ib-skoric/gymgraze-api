require 'rails_helper'

describe AuthenticationController, type: :controller do
  describe "POST to /authenticate endpoint" do
    it "will authenticate the user" do
      post 'create', params: { username: 'john.doe', password: 'test' }

      expect(response).to have_http_status(:created)
      expect(response.body).to eq({
        "token" => '123'
      })
    end

    it "checks if username is missing and returns an error" do
      post 'create', params: { password: 'test'}

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "checks if password is missing and returns an error" do
      post 'create', params: { username: ''}

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

end