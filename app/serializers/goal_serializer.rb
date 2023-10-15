class GoalSerializer < ActiveModel::Serializer
  # ------------ ATTRIBUTES ------------
  attributes :kcal, :steps, :exercise, :updated_at
end
