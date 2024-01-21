class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name

  # ------------ RELATIONSHIPS ------------
  has_one :nutritional_info, serializer: NutritionalInfoSerializer
end
