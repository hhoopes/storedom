class AddApprovalToStores < ActiveRecord::Migration
  def change
    add_column :stores, :approval, :boolean, default: false
  end
end
