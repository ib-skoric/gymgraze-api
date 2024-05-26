require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe MealsController, type: :controller do
before(:all) do
    @user = FactoryBot.build(:jane_doe)
    @meal = FactoryBot.build(:meal)
  end

  describe "POST /meals" do
    it "creates a new meal" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { meal: { name: @meal.name } }

      expect(response).to have_http_status(:created)
    end

    it "returns an error if the meal is invalid" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { meal: { name: nil } }

      expect(response).to have_http_status(422)
      expect(response.body).to include("can't be blank")
    end
  end

  describe "PUT /meals/:id" do
    it "updates all meals" do
      request.headers.merge!(authentication_helper(@user))
      @meal.save
      put "update_all", params: { meals: [{ id: @meal.id, name: "New Name" }] }

      expect(response).to have_http_status(:accepted)
    end
  end

  describe "DELETE /meals/:id" do
    it "deletes a meal" do
      request.headers.merge!(authentication_helper(@user))
      @meal.save
      delete "destroy", params: { id: @meal.id }

      expect(response).to have_http_status(:no_content)
    end
  end
end