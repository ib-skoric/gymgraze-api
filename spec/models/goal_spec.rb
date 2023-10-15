require 'rails_helper'

describe Goal, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe "validations of attribute presence" do
    it "should validate presence of steps" do
      no_steps_goal = Goal.new(steps: nil)

      expect(no_steps_goal).to_not be_valid
      expect(no_steps_goal.errors[:steps]).to include("can't be blank")
    end

    it "should validate presence of kcal goal" do
      no_kcal_goal = Goal.new(kcal: nil)

      expect(no_kcal_goal).to_not be_valid
      expect(no_kcal_goal.errors[:kcal]).to include("can't be blank")
    end

    it "should validate presence of exercise goal" do
      no_exercise_goal = Goal.new(exercise: nil)

      expect(no_exercise_goal).to_not be_valid
      expect(no_exercise_goal.errors[:exercise]).to include("can't be blank")
    end

    it "should validate presence of user" do
      no_user_goal = Goal.new(user: nil)

      expect(no_user_goal).to_not be_valid
      expect(no_user_goal.errors[:user]).to include("must exist")
    end
  end

  describe "validates correct type of attributes (integer)" do
    it "should return an error if steps is not an integer" do
      goal = Goal.new(steps: "abc", kcal: 1000, exercise: 30, user: user)

      expect(goal).to_not be_valid
      expect(goal.errors[:steps]).to include("is not a number")
    end

    it "should return an error if kcal is not an integer" do
      goal = Goal.new(steps: 10000, kcal: "abc", exercise: 30, user: user)

      expect(goal).to_not be_valid
      expect(goal.errors[:kcal]).to include("is not a number")
    end

    it "should return an error if exercise is not an integer" do
      goal = Goal.new(steps: 10000, kcal: 1000, exercise: "abc", user: user)

      expect(goal).to_not be_valid
      expect(goal.errors[:exercise]).to include("is not a number")
    end
  end

  describe "validates integer is 0 or greater" do
    it "should return an error if steps is less than 0" do
      goal = Goal.new(steps: -1, kcal: 1000, exercise: 30, user: user)

      expect(goal).to_not be_valid
      expect(goal.errors[:steps]).to include("must be greater than or equal to 0")
    end

    it "should return an error if kcal is less than 0" do
      goal = Goal.new(steps: 10000, kcal: -1, exercise: 30, user: user)

      expect(goal).to_not be_valid
      expect(goal.errors[:kcal]).to include("must be greater than or equal to 0")
    end

    it "should return an error if exercise is less than 0" do
      goal = Goal.new(steps: 10000, kcal: 1000, exercise: -1, user: user)

      expect(goal).to_not be_valid
      expect(goal.errors[:exercise]).to include("must be greater than or equal to 0")
    end
  end
end
