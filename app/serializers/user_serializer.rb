class UserSerializer < ActiveModel::Serializer

  # ------------ ATTRIBUTES ------------
  attributes :id, :username

  # ------------ RELATIONSHIPS ------------
  has_one :goal
  has_many :meals, serializer: MealSerializer
end
