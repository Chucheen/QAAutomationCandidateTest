class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description
      t.string :name
      t.decimal :price, scale: 2
      t.boolean :status

      t.timestamps null: false
    end
  end
end
