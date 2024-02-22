require 'rails_helper'

RSpec.describe "Exercises", type: :request do
  describe "POST /new" do
    it "creates a new exercise" do
      post "/exercises", params: { exercise: { name: "Squats", exercise_type: "strength" } }
      expect(response).to have_http_status(201)

      expect(response.body).to include("Squats")
    end
  end
end
