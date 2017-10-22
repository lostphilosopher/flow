class PlansController < ApplicationController
  before_action :find

  def show
  end

  private

  def find
    @plan = Plan.find(params[:id])
  end
end
