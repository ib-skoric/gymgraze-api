require 'rails_helper'

RSpec.describe "Exercises", type: :request do
  describe "POST /new" do
    it "creates a new exercise" do
      post "/exercises", params: { exercise: { name: "Squats", exercise_type: "strength" } }
      expect(response).to have_http_status(201)

      expect(response.body).to include("Squats")
    end

    it "returns an error if the exercise is invalid" do
      post "/exercises", params: { exercise: { name: nil, exercise_type: "strength" } }
      expect(response).to have_http_status(422)

      expect(response.body).to include("Name can't be blank")
    end

    it "returns an error if the exercise type is invalid" do
      post "/exercises", params: { exercise: { name: "Squats", exercise_type: "something else" } }
      expect(response).to have_http_status(422)

      expect(response.body).to include("Exercise type is not included in the list")
    end
  end
end
