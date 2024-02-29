require 'rails_helper'

RSpec.describe ExerciseSetController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns/indexes all sets for a given exercise" do
      exercise = FactoryBot.create(:exercise)
      exercise_set = FactoryBot.create(:exercise_set, exercise_id: exercise.id)

      get :index, params: { exercise_id: exercise.id }
      expect(assigns(:exercise_sets)).to eq([exercise_set])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      exercise_set = FactoryBot.create(:exercise_set)
      get :show, params: { id: exercise_set.id }
      expect(response).to have_http_status(:success)
    end

    it "returns the correct exercise set" do
      exercise_set = FactoryBot.create(:exercise_set)
      get :show, params: { id: exercise_set.id }
      expect(assigns(:exercise_set)).to eq(exercise_set)
    end
  end
end