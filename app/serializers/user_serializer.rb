class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :num_orders

  has_many :orders

  def num_orders
    object.orders.count
  end
end
