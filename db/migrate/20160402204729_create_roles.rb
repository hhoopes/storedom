class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :category

      t.timestamps
    end
  end
end
