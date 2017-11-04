class PlansController < ApplicationController
  before_action :find, except: [:index]

  def show
  end

  def index
    @plans = Plan.all
  end

  private

  def find
    @plan = Plan.find(params[:id])
  end
end
