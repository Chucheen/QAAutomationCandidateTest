class AddClosedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :closed, :boolean
  end
end
