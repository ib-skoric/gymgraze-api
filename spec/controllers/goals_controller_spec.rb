require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe GoalsController, type: :controller do

    before(:all) do
      @user = FactoryBot.create(:jane_doe)
      @goal = FactoryBot.create(:goal)
    end

  describe "POST #create" do
    it "should not create a goal if kcal are not provided" do
      request.headers.merge!(authentication_helper(@user))
      goal = Goal.new(steps: 10000, kcal: nil, exercise: 30)
      post :create, params: { goal: goal.attributes }

      expect(response).to have_http_status(:unprocessable_entity)
      # expect it to return an error message
      expect(response.body).to include("can't be blank")
    end

    it "should not create a goal if steps are not provided" do
      request.headers.merge!(authentication_helper(@user))
      goal = Goal.new(steps: nil, kcal: 2000, exercise: 30)
      post :create, params: { goal: goal.attributes }

      expect(response).to have_http_status(:unprocessable_entity)
      # expect it to return an error message
      expect(response.body).to include("can't be blank")
    end

    it "should not create a goal if exercise target is not provided" do
      request.headers.merge!(authentication_helper(@user))
      goal = Goal.new(steps: 10000, kcal: 2000, exercise: nil)
      post :create, params: { goal: goal.attributes }

      expect(response).to have_http_status(:unprocessable_entity)
      # expect it to return an error message
      expect(response.body).to include("can't be blank")
    end
  end

  describe "GET #index" do
    it "should return a goal" do
      request.headers.merge!(authentication_helper(@user))
      goal = Goal.create(steps: 10000, kcal: 2000, exercise: 30)
      get :index

      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT #update_goal" do
    it "should update a goal" do
      request.headers.merge!(authentication_helper(@user))
      updated_goal = Goal.create(steps: 20000, kcal: 1500, exercise: 50)
      put :update_goal, params: { goal: updated_goal.attributes }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("20000")
    end
  end
end