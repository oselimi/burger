json.extract! order, :id, :no, :date, :name, :address, :telephone, :pay_type, :created_at, :updated_at
json.url order_url(order, format: :json)
