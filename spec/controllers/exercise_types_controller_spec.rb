require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe ExerciseTypesController, type: :controller do
before(:all) do
    @user = FactoryBot.build(:jane_doe)
    @exercise_type = FactoryBot.build(:exercise_type)
  end

  describe "POST /exercise_types" do
    it "creates a new exercise type" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { exercise_type: { name: @exercise_type.name, exercise_category: @exercise_type.exercise_category } }

      expect(response).to have_http_status(:created)
    end

    it "returns an error if the exercise type is invalid" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { exercise_type: { name: nil } }

      expect(response).to have_http_status(422)
      expect(response.body).to include("can't be blank")
    end
  end

  describe "PUT /exercise_types/:id" do
    it "updates an exercise type" do
      request.headers.merge!(authentication_helper(@user))
      @exercise_type.save
      put "update", params: { id: @exercise_type.id, exercise_type: { name: "New Name" } }

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /exercise_types" do
    it "returns a list of exercise types" do
      request.headers.merge!(authentication_helper(@user))
      @exercise_type.save
      get "index"

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(@exercise_type.name)
    end
  end
end