require 'rails_helper'

RSpec.describe ExerciseSetController, type: :controller do
  before(:all) do
    @user = FactoryBot.build(:jane_doe)
    @workout_diary_entry = FactoryBot.create(:workout_diary_entry)
    @workout = FactoryBot.create(:workout, workout_diary_entry: @workout_diary_entry, user: @user)
    @exercise_type = FactoryBot.create(:exercise_type)
    @exercise = FactoryBot.create(:exercise, workout: @workout, exercise_type: @exercise_type)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns/indexes all sets for a given exercise" do
      exercise_set = FactoryBot.create(:exercise_set, exercise_id: @exercise.id, workout: @workout)

      get :index, params: { exercise_id: @exercise.id }
      expect(assigns(:exercise_sets)).to eq([exercise_set])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      exercise_set = FactoryBot.create(:exercise_set, exercise_id: @exercise.id, workout: @workout)
      get :show, params: { id: exercise_set.id }
      expect(response).to have_http_status(:success)
    end

    it "returns the correct exercise set" do
      exercise_set = FactoryBot.create(:exercise_set, exercise_id: @exercise.id, workout: @workout)
      get :show, params: { id: exercise_set.id }
      expect(assigns(:exercise_set)).to eq(exercise_set)
    end
  end
end