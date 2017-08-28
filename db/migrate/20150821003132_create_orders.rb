class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_no
      t.integer :Customer_id
      t.decimal :total, scale: 2
      t.date :date
    end
  end
end
