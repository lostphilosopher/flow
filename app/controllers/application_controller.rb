class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def validate_admin_or_creator
    flash[:alert] = "That action can only be performed by admins or creators"
    redirect_to root_path unless admin_or_creator?
  end

  def validate_admin
    flash[:alert] = "That action can only be performed by admins"
    redirect_to root_path unless admin_or_creator?
  end

  def admin_or_creator?
    current_user && current_user.admin_or_creator?
  end

  def admin?
    current_user && current_user.admin?
  end

  def creator?
    current_user && current_user.creator?
  end
end
