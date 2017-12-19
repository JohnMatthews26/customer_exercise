class Category < ApplicationRecord
  validates :category_name, presence: true
  has_many :categories, class_name: :CategoriesJoinTable, foreign_key: "category_id"
  has_many :products, through: :categories, source: :product
  
end
