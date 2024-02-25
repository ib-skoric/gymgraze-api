require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

RSpec.describe WorkoutDiaryEntriesController, type: :controller do

    before(:all) do
      @user = FactoryBot.build(:jane_doe)
    end

    describe "POST /workout_diary_entries" do
      it "creates a new exercise diary entry" do
        request.headers.merge!(authentication_helper(@user))
        post "create", params: { exercise_diary_entry: { date: Date.today, calories_burned: 300 } }

        expect(response).to have_http_status(201)
        expect(response.body).to include(Date.today.to_s)
      end

      it "returns an error if the exercise diary entry is invalid" do
        request.headers.merge!(authentication_helper(@user))
        post "create", params: { exercise_diary_entry: { date: nil, calories_burned: 30 } }

        expect(response).to have_http_status(422)
        expect(response.body).to include("can't be blank")
      end
    end
end