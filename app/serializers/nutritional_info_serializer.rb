class NutritionalInfoSerializer < ActiveModel::Serializer
  attributes :id, :kcal, :carbs, :protein, :fat, :salt, :sugar, :fiber

  def kcal
    object.kcal.to_f
  end

  def carbs
    object.carbs.to_f
  end

  def protein
    object.protein.to_f
  end

  def fat
    object.fat.to_f
  end

  def salt
    object.salt.to_f
  end

  def sugar
    object.sugar.to_f
  end

  def fiber
    object.fiber.to_f
  end

end
