class AdminController < ApplicationController
  before_action :validate_admin_or_creator, only: [:index]
  before_action :validate_admin, except: [:index]
  before_action :find_user, only: [:make_admin, :make_creator, :make_user, :delete_user]

  def index
  end

  # Users come from Devise hack availability here
  # @todo This, but better
  def users
    @users = User.all
  end

  def make_admin
    @user.update(role: 'admin')
    redirect_to admin_users_path
  end

  def make_creator
    @user.update(role: 'creator')
    redirect_to admin_users_path
  end

  def make_user
    @user.update(role: nil)
    redirect_to admin_users_path
  end

  def delete_user
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
