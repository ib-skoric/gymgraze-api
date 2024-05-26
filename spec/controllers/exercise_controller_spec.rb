require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

RSpec.describe ExercisesController, type: :controller do

  before(:all) do
    @user = FactoryBot.build(:jane_doe)
    @workout_diary_entry = FactoryBot.create(:workout_diary_entry)
    @workout = FactoryBot.create(:workout, workout_diary_entry: @workout_diary_entry, user: @user)
    @exercise_type = FactoryBot.create(:exercise_type)
  end

  describe "POST /exercises" do
    it "creates a new exercise" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { exercises: [{ name: "Squats", exercise_category: "strength", workout_id: @workout.id, exercise_type_id: @exercise_type.id }] }

      expect(response).to have_http_status(201)
    end

    it "returns an error if the exercise is invalid" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { exercises: [{ name: nil, exercise_category: nil, workout_id: nil, exercise_type_id: nil }] }

      expect(response).to have_http_status(422)
      expect(response.body).to include("must exist")
    end

    it "returns an error if the user is not authenticated" do
      post "create", params: { exercises: [{ name: "Squats", exercise_category: "strength", workout_id: @workout.id, exercise_type_id: @exercise_type.id }] }

      expect(response).to have_http_status(401)
    end
  end
end
