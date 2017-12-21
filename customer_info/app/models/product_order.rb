class ProductOrder < ApplicationRecord
  validates :product_id, presence: true
  validates :order_id, presence: true
  belongs_to :order,
    primary_key: :id,
    foreign_key: :order_id,
    class_name: :Order
  belongs_to :product,
    primary_key: :id,
    foreign_key: :product_id,
    class_name: :Product
end
