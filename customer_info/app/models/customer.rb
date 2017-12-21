class Customer < ApplicationRecord
  has_many :orders, class_name: :Order, foreign_key: "customer_id"
end
