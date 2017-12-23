class StagesController < ApplicationController
  before_action :validate_admin_or_creator, only: [:new, :create]

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

  private

  def stage_params
    params.require(:stage).permit(
      :name,
      :stage_type,
      :description,
      :url
    )
  end
end
