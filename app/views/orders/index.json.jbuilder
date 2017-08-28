json.array!(@orders) do |order|
  json.extract! order, :id, :order_no, :Customer_id, :total, :date
  json.url order_url(order, format: :json)
end
