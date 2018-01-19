class Api::OrdersController < ApplicationController


  def index

    date_range = (Date.new(params[:start_date]["year"].to_i,
    params[:start_date]["month"].to_i, params[:start_date]["day"].to_i)..Date.new(params[:end_date]["year"].to_i,
    params[:end_date]["month"].to_i, params[:end_date]["day"].to_i)).to_a

    @orders= Order.where(order_date: date_range)
    @orders_arr = []
    @daily_orders = {}
    @weekly_orders = {}
    @monthly_orders = {}
    
    date_range.each do |date|
      week = date.cweek.to_s + ", " + date.cwyear.to_s
      month = date.mon.to_s + ", " + date.cwyear.to_s
      orders = Order.where(order_date: date)
      if orders.empty?
        next
      end

      @weekly_orders[week] = {}
      @daily_orders[date] = {}
      @monthly_orders[month] = {}
      orders.each do |order|
          single_order = ProductOrder.where(order_id: order.id)
          if @daily_orders[date][single_order[0].product_id]
            @daily_orders[date][single_order[0].product_id] += single_order[0].number_purchased
          else
            @daily_orders[date][single_order[0].product_id] = single_order[0].number_purchased
          end
          if @weekly_orders[week][single_order[0].product_id]
            @weekly_orders[week][single_order[0].product_id] += single_order[0].number_purchased
          else
            @weekly_orders[week][single_order[0].product_id] = single_order[0].number_purchased
          end
          if @monthly_orders[month][single_order[0].product_id]
            @monthly_orders[month][single_order[0].product_id] += single_order[0].number_purchased
          else
            @monthly_orders[month][single_order[0].product_id] = single_order[0].number_purchased
          end
        end

    end
    @orders_arr.push(@daily_orders)
    @orders_arr.push(@weekly_orders)
    @orders_arr.push(@monthly_orders)
    if params["CSV"]
      send_data @orders.export_orders_to_csv, filename: "orders-#{Date.today}.csv"
    else
      render json: @orders_arr
    end

  end


  private
  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end


end
