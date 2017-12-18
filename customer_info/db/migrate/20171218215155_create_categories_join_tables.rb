class CreateCategoriesJoinTables < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_join_tables do |t|
      t.integer :product_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
