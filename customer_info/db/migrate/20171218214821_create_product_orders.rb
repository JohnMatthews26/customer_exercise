class CreateProductOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :product_orders do |t|
      t.integer :product_id, null: false
      t.decimal :number_purchased, null: false, precision: 15, scale: 2
      t.integer :order_id, null: false
      t.timestamps
    end
  end
end
