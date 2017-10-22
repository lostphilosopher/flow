class Plan < ApplicationRecord
  has_many :plan_stages
  has_many :stages, through: :plan_stages

  def starting_stage
    PlanStage.find_by(
      plan_id: id,
      order: 1
    )
  end
end
