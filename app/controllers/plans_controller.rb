class PlansController < ApplicationController
  before_action :find, except: [:index, :new, :create]

  def build_new
  end

  def build_create
    plan_stage = PlanStage.new(plan_id: @plan.id, stage_id: build_params[:stage_id])
    if plan_stage.save
      redirect_to build_new_plan_path(id: @plan.id)
    else
      #
    end
  end

  def new
    @plan = Plan.new
  end

  def create
    plan = Plan.new(plan_params)
    if plan.save
      redirect_to new_stage_path
    else
      //
    end
  end

  def show
  end

  def index
    @plans = Plan.all
  end

  private

  def find
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(
      :name,
      :description
    )
  end

  def build_params
    params.require(:stage).permit(:stage_id)
  end
end
