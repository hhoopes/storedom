class AddUserToUserRole < ActiveRecord::Migration
  def change
    add_reference :user_roles, :user, index: true
  end
end
