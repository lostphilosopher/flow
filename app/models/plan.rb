class Plan < ApplicationRecord
  has_many :plan_stages, dependent: :destroy
  has_many :stages, through: :plan_stages
  validates :name, presence: true
  validates :description, presence: true

  def has_stages?
    plan_stages.count > 0
  end

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

  def refresh_order
    count = plan_stages.count
    order = 1
    count.times do
      plan_stage = recurssive_order_search(order, count)
      plan_stage.update(order: order) if plan_stage
      order = order + 1
    end
  end

  def recurssive_order_search(order = 1, max_order = 1)
    plan_stage = PlanStage.find_by(plan_id: id, order: order)

    return plan_stage if plan_stage
    order = order + 1
    return nil if order > max_order + 1

    recurssive_order_search(order, max_order)
  end
end
