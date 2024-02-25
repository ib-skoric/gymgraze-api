require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe WorkoutsController, type: :controller do
  before(:all) do
    @user = FactoryBot.build(:jane_doe)
    @workout_entry = WorkoutDiaryEntry.create!(date: Date.tomorrow + 1.days, user_id: @user.id)
  end

  describe "POST /workouts" do
    it "creates a new workout" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { workout: { date: Date.tomorrow, workout_diary_entry_id: @workout_entry.id, calories_burned: 300 } }

      expect(response).to have_http_status(:created)
    end

    it "returns an error if the workout is invalid" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { workout: { date: nil } }

      expect(response).to have_http_status(422)
      expect(response.body).to include("can't be blank")
    end
  end
end