class AccountController < ApplicationController
  before_action :find_account

  def show
  end

  private

  def find_account
    @account = current_user.account
  end
end
