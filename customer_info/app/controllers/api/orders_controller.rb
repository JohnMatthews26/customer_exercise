class Api::OrdersController < ApplicationController
  def index
    p params[:start_date]["year"]
    date_range = (Date.new(params[:start_date]["year"].to_i,
    params[:start_date]["month"].to_i, params[:start_date]["day"].to_i)..Date.new(params[:end_date]["year"].to_i,
    params[:end_date]["month"].to_i, params[:end_date]["day"].to_i))
    orders = Order.where(order_date: date_range)
    @product_orders = []
    orders.each do |order|
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
    params.require(:order).permit(:start_date, :end_date)
  end
end
