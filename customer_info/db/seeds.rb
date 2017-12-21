# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
customer1 = Customer.create(customer_first_name: "John")
order1 = Order.create(customer_id: customer1.id, order_status: "delivered", order_date: Date.today)
