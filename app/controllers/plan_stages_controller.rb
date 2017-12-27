class PlanStagesController < ApplicationController
  before_action :find
  before_action :validate_admin_or_creator, only: [:new, :create, :destroy]

  def new
    @plan_stage = PlanStage.new
    @previous_plan_stage = @plan.ending_plan_stage ? @plan.ending_plan_stage : PlanStage.new
  end

  def create
    plan_stage = PlanStage.new(plan_stage_params)
    if plan_stage.save!
      return redirect_to new_plan_plan_stage_path(id: @plan.id)
    else
      #
    end
  end

  def show
  end

  def destroy
    @plan_stage.delete
    @plan.refresh_order
    redirect_to plan_path(id: @plan.id)
  end

  private

  def find
    @plan_stage = PlanStage.find_by(id: params[:id])
    @plan = Plan.find_by(id: params[:plan_id])
    @stage = @plan_stage ? Stage.find_by(id: @plan_stage.stage.id) : nil
  end

  def plan_stage_params
    params.require(:plan_stage).permit(
      :plan_id,
      :stage_id,
      :order
    )
  end
end
