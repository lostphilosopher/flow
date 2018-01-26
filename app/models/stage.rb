class Stage < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :stage_type, presence: true

  def in_use?
    plan_stages.count > 0
  end

  def plan_stages
    PlanStage.where(stage_id: id)
  end

  def plans
    # @todo This, but better...
    plans = []
    plan_stages.each do |plan_stage|
      plan = Plan.find_by(id: plan_stage.plan_id)
      plans << Plan.find(plan_stage.plan_id) if plan
    end
    plans.uniq
  end
end
