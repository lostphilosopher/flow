class StagesController < ApplicationController
  before_action :find, except: [:new, :create]
  before_action :validate_admin_or_creator, only: [:new, :edit, :update, :create]

  def new
    @stage = Stage.new
  end

  def create
    stage = Stage.new(stage_params)
    if stage.save
      redirect_to new_stage_path
    else
      //
    end
  end

  def edit
  end

  def update
    @stage.update(stage_params)
    redirect_to plans_path
  end

  private

  def find
    @stage = Stage.find(params[:id])
  end

  def stage_params
    params.require(:stage).permit(
      :name,
      :stage_type,
      :description,
      :url
    )
  end
end
