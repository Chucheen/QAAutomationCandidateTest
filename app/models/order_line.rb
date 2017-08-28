class OrderLine < ActiveRecord::Base
    belongs_to :order
    belongs_to :product

    after_save :register_save
    after_destroy :register_destroy

    def register_save
        order = Order.find(self.order.id)
        order.total = order.order_lines.sum(:total_price)
        order.save!
    end

    def register_destroy
        order = Order.find(self.order.id)
        order.total = order.order_lines.sum(:total_price)
        order.save!
    end
end
