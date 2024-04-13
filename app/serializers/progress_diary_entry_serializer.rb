class ProgressDiaryEntrySerializer < ActiveModel::Serializer
  attributes :id, :date, :weight, :arm_measurement, :waist_measurement, :body_fat_percentage, :chest_measurement

  def weight
    object.weight.to_f
  end

  def arm_measurement
    object.arm_measurement.to_f
  end

  def waist_measurement
    object.waist_measurement.to_f
  end

  def body_fat_percentage
    object.body_fat_percentage.to_f
  end

  def chest_measurement
    object.chest_measurement.to_f
  end
end
