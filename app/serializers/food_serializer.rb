class FoodSerializer < ActiveModel::Serializer
  attributes :id, :barcode, :name, :amount, :total_nutrition

  # ------------ RELATIONSHIPS ------------
  has_one :nutritional_info, serializer: NutritionalInfoSerializer

  has_one :meal, serializer: MealSerializer

  def amount
    object.amount.to_f
  end

  def total_nutrition
    if object.nutritional_info
      {
        kcal: ((object.nutritional_info.kcal / 100) * object.amount).to_i,
        carbs: ((object.nutritional_info.carbs / 100) * object.amount).to_f,
        protein: ((object.nutritional_info.protein / 100) * object.amount).to_f,
        fat: ((object.nutritional_info.fat / 100) * object.amount).to_f,
        salt: (10.0 / 100) * object.amount.to_f,
        sugar: ((object.nutritional_info.sugar / 100) * object.amount).to_f,
        fiber: ((object.nutritional_info.fiber / 100) * object.amount).to_f,
      }
    else
      {
        kcal: 0,
        carbs: 0,
        protein: 0,
        fat: 0,
        salt: 0,
        sugar: 0,
        fiber: 0,
      }
    end
  end
end
