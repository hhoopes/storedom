class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :uname, :order_count

  has_many :orders, serializer: ItemOrderSerializer #how to change it from the default

  def uname
    object.name.upcase
  end

  def order_count
    object.orders.count
  end
end
