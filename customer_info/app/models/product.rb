class Product < ApplicationRecord
  validates :product_name, presence: true
  has_many :products, class_name: :CategoriesJoinTable, foreign_key: "product_id"
  has_many :categories, through: :products, source: :category
end
