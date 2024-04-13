class ProgressDiaryEntrySerializer < ActiveModel::Serializer
  attributes :id, :date, :weight, :arm_measurement, :waist_measurement, :hip_measurement, :chest_measurement
end
