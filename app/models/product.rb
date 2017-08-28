class Product < ActiveRecord::Base
    has_many :order_lines
    def in_current_order(current_user)
        order_lines.where(order: current_user.current_order.try(:id)).sum(:qty)
    end
end
