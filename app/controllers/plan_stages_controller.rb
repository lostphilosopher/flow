class PlanStagesController < ApplicationController
  before_action :find

  def show
  end

  private
  def find
    @plan_stage = PlanStage.find_by(id: params[:id])
    @plan = Plan.find_by(id: @plan_stage.plan_id)
    @stage = Stage.find_by(id: @plan_stage.stage_id)
  end
end
