class Order < ApplicationRecord
  validates :customer_id, presence: true
  validates :order_status, presence: true
  validates :order_date, presence: true
  belongs_to :customer,
    primary_key: :id,
    foreign_key: :customer_id,
    class_name: :Customer
  has_many :product_orders,
    primary_key: :id,
    foreign_key: :product_id,
    class_name: :ProductOrder


end
