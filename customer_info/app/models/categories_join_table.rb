class CategoriesJoinTable < ApplicationRecord
  validates :product_id, presence: true
  validates :category_id, presence: true
  belongs_to :category,
    primary_key: :id,
    foreign_key: :category_id,
    class_name: :Category
  belongs_to :product,
    primary_key: :id,
    foreign_key: :product_id,
    class_name: :Product
end
