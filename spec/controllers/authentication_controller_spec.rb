require 'rails_helper'

describe AuthenticationController, type: :controller do
  describe "POST to /authenticate endpoint" do
    it "will authenticate the user" do
      post 'create', params: { username: 'john.doe', password: 'test' }

      expect(response).to have_http_status(:created)
      expect(response.body).to eq("")
    end
  end

end