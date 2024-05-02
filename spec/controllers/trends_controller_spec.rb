require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe TrendsController, type: :controller do
  before(:all) do
    @user = FactoryBot.build(:jane_doe)
  end

  describe "GET /trends" do
    it "fetches trends" do
      request.headers.merge!(authentication_helper(@user))
      get "index"

      expect(response).to have_http_status(:ok)
    end
  end
end