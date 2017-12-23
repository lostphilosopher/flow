class PlansController < ApplicationController
  before_action :find, except: [:index, :new, :create]
  before_action :validate_admin_or_creator, only: [:new, :create, :publish]

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
    @unpublished_plans = Plan.where(published: [false, nil])
    @published_plans = Plan.where(published: true)
  end

  def publish
    @plan.update(published: true)
    redirect_to plan_path(id: @plan.id)
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
end
