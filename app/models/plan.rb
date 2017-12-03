class Plan < ApplicationRecord
  has_many :plan_stages
  has_many :stages, through: :plan_stages

  def ending_plan_stage
    order = PlanStage.where(
      plan_id: id
    ).maximum(:order)

    PlanStage.find_by(
      plan_id: id,
      order: order
    )
  end

  def starting_plan_stage
    PlanStage.find_by(
      plan_id: id,
      order: 1
    )
  end
end
