# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
Customer.destroy_all
Product.destroy_all
Order.destroy_all
ProductOrder.destroy_all

customer1 = Customer.create(customer_first_name: "John")
customer2 = Customer.create(customer_first_name: "Bob")
product1 = Product.create(product_name: "Shoes")
order1 = Order.create(customer_id: customer1.id, order_status: "delivered", order_date: Date.today)
order2 = Order.create(customer_id: customer2.id, order_status: "delivered", order_date: Date.today)
productorder1 = ProductOrder.create(product_id: product1.id, number_purchased: 15, order_id: order1.id)
productorder2 = ProductOrder.create(product_id: product1.id, number_purchased: 15, order_id: order2.id)
