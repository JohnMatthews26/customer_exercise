class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :order_stauts, null: false
      t.date :order_date, null: false
      t.timestamps
    end
  end
end
