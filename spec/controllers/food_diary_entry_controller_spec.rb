# frozen_string_literal: true

require 'rspec'

describe FoodDiaryEntryController, type: :controller do
  describe "GET /food_diary_entry endpoint" do
    it "should return all food diary entries for that user" do
      user = FactoryBot.create(:user)
      meal = FactoryBot.create(:meal, user_id: user.id)
      food = FactoryBot.create(:food)
      food_diary_entry = FactoryBot.create(:food_diary_entry, user_id: user.id)

      get :index

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq({
        "food_diary_entries" => [{
          "id" => food_diary_entry.id,
          "date" => food_diary_entry.date.strftime("%FT%T.%LZ"),
          "created_at" => food_diary_entry.created_at.strftime("%FT%T.%LZ"),
          "updated_at" => food_diary_entry.updated_at.strftime("%FT%T.%LZ")
        }]
      })
    end
  end
end
