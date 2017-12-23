class AdminController < ApplicationController
  before_action :validate_admin_or_creator, only: [:index]
  before_action :validate_admin, only: [:users]

  def index
  end
end
