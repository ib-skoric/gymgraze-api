require 'rails_helper'

RSpec.describe "FoodDiaryEntries", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/food_diary_entry/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/food_diary_entry/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/food_diary_entry/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/food_diary_entry/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/food_diary_entry/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
