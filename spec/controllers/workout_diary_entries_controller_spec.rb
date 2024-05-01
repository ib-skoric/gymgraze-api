require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

RSpec.describe WorkoutDiaryEntriesController, type: :controller do

    before(:all) do
      @user = FactoryBot.build(:jane_doe)
    end

    describe "POST /workout_diary_entries" do
      it "creates a new workout diary entry" do
        request.headers.merge!(authentication_helper(@user))
        date = Date.today + rand(1..99999).days
        post "create", params: { workout_diary_entry: { date: date, user_id: @user.id } }

        expect(response).to have_http_status(201)
        expect(response.body).to include(date.to_s)
      end

      it "returns an error if the workout diary entry is invalid" do
        request.headers.merge!(authentication_helper(@user))
        post "create", params: { workout_diary_entry: { date: nil } }

        expect(response).to have_http_status(422)
        expect(response.body).to include("can't be blank")
      end

      it "returns an error if the diary entry with that date already exists for this user" do
        request.headers.merge!(authentication_helper(@user))
        post "create", params: { workout_diary_entry: { date: Date.today, user_id: @user.id } }
        post "create", params: { workout_diary_entry: { date: Date.today, user_id: @user.id } }

        expect(response).to have_http_status(422)
        expect(response.body).to include("has already been taken")
      end
    end
end