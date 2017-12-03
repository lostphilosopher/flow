class StagesController < ApplicationController
  def new
    @stage = Stage.new
  end

  def create
    stage = Stage.new(stage_params)
    if stage.save
      redirect_to stages_route(stage)
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
