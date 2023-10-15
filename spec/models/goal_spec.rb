require 'rails_helper'

describe Goal, type: :model do
  describe "validations" do
    it { should validate_presence_of :steps }
    it { should validate_presence_of :kcal }
    it { should validate_presence_of :exercise }

    it { should validate_numericality_of(:steps).only_integer }
    it { should validate_numericality_of(:kcal).only_integer }
    it { should validate_numericality_of(:exercise).only_integer }
  end
end
