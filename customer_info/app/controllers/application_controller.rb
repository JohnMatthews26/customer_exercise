require 'date'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def test_query
    CustomerInfo.execute(<<-SQL)
    SELECT
    customers.id, customers.customer_first_name,
    categories.id, categories.category_name, product_orders.number_purchased
    FROM
    customers
    JOIN orders ON
    customers.id = orders.customer_id
    JOIN product_orders ON
    orders.id = product_orders.order_id
    JOIN categories_join_tables ON
    product_orders.product_id = categories_join_tables.product_id
    where
    customers.id = 1 and product_orders.number_purchased = 15 and categories.id = 1
    SQL
  end


end
