json.array!(@order_lines) do |order_line|
  json.extract! order_line, :id, :order_id, :product_id, :qty, :unit_price, :total_price
  json.url order_line_url(order_line, format: :json)
end
