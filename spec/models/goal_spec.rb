require 'rails_helper'

describe Goal, type: :model do
  describe "validations" do
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
end
