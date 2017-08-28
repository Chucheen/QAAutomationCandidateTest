class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :qty
      t.decimal :unit_price, scale: 2
      t.decimal :total_price, scale: 2

      t.timestamps null: false
    end
  end
end
