class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true
  validates :password, presence: true

  has_many :orders
  has_many :user_roles
  has_many :roles, through: :user_roles

  def platform_admin?
    roles.exists?(category: "platform_admin")
  end

  def store_admin?
    roles.exists?(category: "store_admin")
  end

  def registered_user?
    roles.exists?(category: "registered_user")
  end
end
