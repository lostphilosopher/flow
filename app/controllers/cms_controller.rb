class CmsController < ApplicationController
  before_action :find, except: [:new, :create, :index]
  before_action :validate_admin

  def new
    @cm = Cm.new
  end

  def create
    cm = Cm.new(cm_params)
    if cm.save
      redirect_to cm_path(id: cm.id)
    else
      flash[:alert] = "Content not saved: #{cm.errors.full_messages}"
      redirect_to new_cm_path
    end
  end

  def index
    @cms = Cm.all
  end

  def edit
  end

  def update
    @cm.update(cm_params)
    redirect_to cm_path(id: @cm.id)
  end

  def show
  end

  def destroy
    @cm.destroy
    redirect_to cms_path
  end

  private

  def find
    @cm = Cm.find(params[:id])
  end

  def cm_params
    params.require(:cm).permit(
      :name,
      :body
    )
  end
end
