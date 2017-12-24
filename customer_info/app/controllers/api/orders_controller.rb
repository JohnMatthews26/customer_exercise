class Api::OrdersController < ApplicationController
  # def index
  #
  #   date_range = (Date.new(params[:start_date]["year"].to_i,
  #   params[:start_date]["month"].to_i, params[:start_date]["day"].to_i)..Date.new(params[:end_date]["year"].to_i,
  #   params[:end_date]["month"].to_i, params[:end_date]["day"].to_i))
  #
  #
  #   orders = Order.where(order_date: date_range)
  #
  #   @orders_arr = []
  #   @daily_orders = {}
  #   orders.each do |order|
  #     single_order = ProductOrder.where(order_id: order.id)
  #
  #     @orders_arr.push({
  #       order_date: order.order_date,
  #       product_id: single_order[0].product_id,
  #       number_purchased: single_order[0].number_purchased
  #       })
  #   end
  #   render json: @orders_arr
  #
  # end

  def index

    date_range = (Date.new(params[:start_date]["year"].to_i,
    params[:start_date]["month"].to_i, params[:start_date]["day"].to_i)..Date.new(params[:end_date]["year"].to_i,
    params[:end_date]["month"].to_i, params[:end_date]["day"].to_i)).to_a


    @orders_arr = []
    # @daily_orders = {}
    date_range.each do |date|

      orders = Order.where(order_date: date)
      if orders.empty?
        next
      end
      @daily_orders = {}
      @daily_orders[date] = {}
      orders.each do |order|
          single_order = ProductOrder.where(order_id: order.id)
          if @daily_orders[date][single_order[0].product_id]
            @daily_orders[date][single_order[0].product_id] += single_order[0].number_purchased
          else
            @daily_orders[date][single_order[0].product_id] = single_order[0].number_purchased
          end
        end
        @orders_arr.push(@daily_orders)
    end
    render json: @orders_arr

  end


  private
  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end
end
