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

    def self.export_orders_to_csv
      attributes = ['Order_id', 'Customer_Id']
      CSV.generate(headers: true) do |csv|
        csv << attributes
        all.each do |category|
          csv << [category.id, category.customer_id]
        end
      end
    end
end
