require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe FoodDiaryEntryController do

  before(:all) do
    @user = FactoryBot.build(:jane_doe)
  end

  describe "GET to /food_diary_entries endpoint" do
    it "should return a status of 200 OK" do
      request.headers.merge!(authentication_helper(@user))
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "should return a list of food diary entries as empty" do
      request.headers.merge!(authentication_helper(@user))
      get :index
      expect(response.body).to eq("[]")
    end

    it "should return an entry object when there is one" do
      @food_entry = FactoryBot.create(:food_diary_entry, user_id: @user.id, date: Date.today)

      request.headers.merge!(authentication_helper(@user))
      get :index
      body = JSON.parse(response.body)
      expect(body.length).to eq(1)
    end

    it "should return the correct date and ID of the entry" do
      @food_entry = FactoryBot.create(:food_diary_entry, user_id: @user.id, date: Date.today)

      request.headers.merge!(authentication_helper(@user))
      get :index
      body = JSON.parse(response.body)
      expect(body[0]["id"]).to eq(@food_entry.id)
      expect(body[0]["date"]).to eq(@food_entry.date.to_s)
    end
  end
end
