class UserSerializer < ActiveModel::Serializer

  # ------------ ATTRIBUTES ------------
  attributes :id, :email, :name, :age, :weight, :height, :confirmed_at

  # ------------ RELATIONSHIPS ------------
  # returns the user's goals object
  has_one :goal
  # returns their meal names (breakfast, lunch, dinner, snacks)
  has_many :meals, serializer: MealSerializer
  def confirmed_at
    object.confirmed_at.to_i
  end
end
