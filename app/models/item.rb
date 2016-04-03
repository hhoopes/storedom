class Item < ActiveRecord::Base
  default_scope { where(status: "active") }

  has_many :order_items
  has_many :orders, through: :order_items
<<<<<<< HEAD
=======
  belongs_to :store
>>>>>>> eb751c6613180785a1d21b85f0b219f1a55515c8
end
