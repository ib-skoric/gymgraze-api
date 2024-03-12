class GoalSerializer < ActiveModel::Serializer
  # ------------ ATTRIBUTES ------------
  attributes :kcal, :steps, :exercise, :updated_at

  def updated_at
    object.updated_at.to_i
  end
end
