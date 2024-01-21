class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name

  # ------------ RELATIONSHIPS ------------
  has_many :nutritional_infos, serializer: NutritionalInfoSerializer
end
