require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe FoodsController, type: :controller do

  before(:all) do
    @user = FactoryBot.build(:jane_doe)
  end

  describe "POST #create" do
  it "should not create a food if name is not provided" do
    request.headers.merge!(authentication_helper(@user))
    food = Food.new(name: nil, barcode: 123456789)
    post :create, params: { food: food.attributes }

    expect(response).to have_http_status(:unprocessable_entity)
    # expect it to return an error message
    expect(response.body).to include("can't be blank")
  end

  it "should create a food if name and barcode are provided" do
    request.headers.merge!(authentication_helper(@user))
    meal = FactoryBot.create(:meal)
    food_diary_entry = FactoryBot.create(:food_diary_entry, user_id: @user.id, date: Date.today)
    food = Food.new(name: "banana", barcode: 123456789, meal_id: meal.id, amount: 100)
    post :create, params: { food: food.attributes, food_diary_entry_id: food_diary_entry.id }

    expect(response).to have_http_status(:created)
  end

  it "should not create a food if barcode is not provided" do
    request.headers.merge!(authentication_helper(@user))
    food = Food.new(name: "banana", barcode: nil)
    post :create, params: { food: food.attributes }

    expect(response).to have_http_status(:unprocessable_entity)
    # expect it to return an error message
    expect(response.body).to include("can't be blank")
  end

    it "should return an error if food does not exist" do
      request.headers.merge!(authentication_helper(@user))
      get :show, params: { id: 999999 }

      expect(response).to have_http_status(:not_found)
    end
  end

end