class GoalSerializer < ActiveModel::Serializer
  attributes :kcal, :steps, :exercise, :updated_at
end
