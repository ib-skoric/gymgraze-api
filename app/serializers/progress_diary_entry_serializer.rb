class ProgressDiaryEntrySerializer < ActiveModel::Serializer
  attributes :date, :weight, :arm_measurement, :waist_measurement, :hip_measurementg, :chest_measurement
end
