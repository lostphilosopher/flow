class PlanStage < ApplicationRecord
  belongs_to :plan
  belongs_to :stage

  def next_stage
    Stage.find_by(id: self.next.stage_id)
  end

  def next
    PlanStage.find_by(
      order: order + 1,
      plan_id: plan_id
    )
  end
end
