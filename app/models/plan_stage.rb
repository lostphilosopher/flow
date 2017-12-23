class PlanStage < ApplicationRecord
  belongs_to :plan
  belongs_to :stage

  validates :order, presence: true

  def next_order
    order ? order + 1 : 1
  end

  def next_stage
    return unless next_plan_stage
    Stage.find_by(id: self.next_plan_stage.id)
  end

  def next_plan_stage
    return unless order
    PlanStage.find_by(
      order: order + 1,
      plan_id: plan_id
    )
  end

  def previous_stage
    return unless previous_plan_stage
    Stage.find_by(id: self.previous_plan_stage.id)
  end

  def previous_plan_stage
    return unless order && order > 1
    PlanStage.find_by(
      order: order - 1,
      plan_id: plan_id
    )
  end

  def last?
    plan.ending_plan_stage.id == id
  end
end
