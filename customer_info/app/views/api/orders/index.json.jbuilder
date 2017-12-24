@product_orders.each do |order|
  json.set! order.order_date do
    json.extract! photo, :id, :description, :user_id, :url
    json.username photo.user.username
    json.url asset_path(photo.url)
    json.likes photo.likes
    json.comments photo.comments
  end
end
