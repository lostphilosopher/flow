class StagesController < ApplicationController
  before_action :find, except: [:index, :new, :create, :download_pdf]
  before_action :validate_admin_or_creator, only: [:index, :new, :update, :create]
  before_action :validate_admin, only: [:edit]

  def index
    @stages = Stage.all
  end

  def new
    @stage = Stage.new
  end

  def edit
  end

  def create
    stage = Stage.new(stage_params)
    if stage.save
      redirect_to new_stage_path
    else
      flash[:alert] = "Stage not saved: #{stage.errors.full_messages}"
      redirect_to new_stage_path
    end
  end

  def update
    @stage.update(stage_params)
    redirect_to plans_path
  end

  def destroy
    return if @stage.in_use?

    @stage.destroy
    redirect_to stages_path
  end

  # Source: https://stackoverflow.com/questions/12939903/allowing-user-to-download-file-from-s3-storage
  def download_pdf
    @stage = Stage.find_by(id: params[:stage_id])
    data = open(@stage.resource.url)
    send_data data.read, :type => data.content_type, :x_sendfile => true
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
      :url,
      :resource,
      :image,
      :timer
    )
  end
end
