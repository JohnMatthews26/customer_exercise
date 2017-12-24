class Api::CustomersController < ApplicationController
  def index
    @customer_orders = Order.where(customer_id: params[:customer_id])

    @product_orders = []
    @customer_orders.each do |order|
      single_order = ProductOrder.where(order_id: order.id)
      @product_orders.push({customer_id: order.customer_id,
        order_date: order.order_date,
        product_id: single_order[0].product_id,
        number_purchased: single_order[0].number_purchased})
    end
    render json: @product_orders

  end

  def show
    @customer_orders = Order.where(customer_id: params[:customer_id])

    @product_orders = []
    @customer_orders.each do |order|
      single_order = ProductOrder.where(order_id: order.id)
      @product_orders.push({customer_id: order.customer_id,
        order_date: order.order_date,
        product_id: single_order[0].product_id,
        number_purchased: single_order[0].number_purchased})
    end
    render json: @product_orders
  end


  private
  def order_params
    params.require(:customer).permit(:customer_id)
  end
end
