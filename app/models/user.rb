class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account

  after_create :initialize_account

  def admin_or_creator?
    admin? || creator?
  end

  def admin?
    role == 'admin'
  end

  def creator?
    role == 'creator'
  end

  private

  def initialize_account
    account = Account.new
    update(account: account)
  end
end
