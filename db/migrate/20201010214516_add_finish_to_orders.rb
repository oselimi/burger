class AddFinishToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :finish, :boolean, default: false
  end
end
