require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

RSpec.describe ExercisesController, type: :controller do

  before(:all) do
    @user = FactoryBot.build(:jane_doe)
  end

  describe "POST /exercise" do
    it "creates a new exercise" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { exercise: { name: "Squats", exercise_type: "strength" } }

      expect(response).to have_http_status(201)
      expect(response.body).to include("Squats")
    end

    it "returns an error if the exercise is invalid" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { exercise: { name: nil, exercise_type: "strength" } }

      expect(response).to have_http_status(422)
      expect(response.body).to include("can't be blank")
    end

    it "returns an error if the exercise type is invalid" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { exercise: { name: "Squats", exercise_type: "something else" } }

      expect(response).to have_http_status(422)
      expect(response.body).to include("is not included in the list")
    end
  end
end
