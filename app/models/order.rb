class Order < ActiveRecord::Base
    belongs_to :customer, class_name: 'Customer', foreign_key: 'Customer_id'
    has_many :order_lines
    has_many :products, through: :order_lines

end