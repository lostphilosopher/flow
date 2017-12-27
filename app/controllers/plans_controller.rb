class PlansController < ApplicationController
  before_action :find, except: [:index, :new, :create]
  before_action :validate_admin_or_creator, only: [:new, :edit, :update, :show, :create, :publish, :destroy]

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

  def edit
  end

  def update
    @plan.update(plan_params)
    redirect_to plan_path(id: @plan.id)
  end

  def show
  end

  def destroy
    @plan.delete
    redirect_to plans_path
  end

  def index
    @unpublished_plans = Plan.where(published: [false, nil])
    @published_plans = Plan.where(published: true)
  end

  def publish
    @plan.update(published: true)
    redirect_to plans_path
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
