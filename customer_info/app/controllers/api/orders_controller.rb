class Api::OrdersController < ApplicationController
  def index
    p ["----", params[:start_date]["year"]]
    p params[:start_date]["year"].to_i
    p params[:end_date]
    date_range = (Date.new(params[:start_date]["year"].to_i,
    params[:start_date]["month"].to_i, params[:start_date]["day"].to_i)..Date.new(params[:end_date]["year"].to_i,
    params[:end_date]["month"].to_i, params[:end_date]["day"].to_i))

    p date_range
    orders = Order.where(order_date: date_range)
    render(
    json: [orders]
    )
  end

  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end
end
