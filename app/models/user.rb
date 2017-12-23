class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin_or_creator?
    admin? || creator?
  end

  def admin?
    role == 'admin'
  end

  def creator?
    role == 'creator'
  end
end
