class Product < ApplicationRecord
  validates :product_name, presence: true
  has_many :products, class_name: :CategoriesJoinTable, foreign_key: "product_id"
  has_many :categories, through: :products, source: :category
  has_many :product_orders, class_name: :ProductOrder, foreign_key: "product_id"
end
