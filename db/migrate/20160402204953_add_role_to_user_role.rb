class AddRoleToUserRole < ActiveRecord::Migration
  def change
    add_reference :user_roles, :role, index: true
  end
end
