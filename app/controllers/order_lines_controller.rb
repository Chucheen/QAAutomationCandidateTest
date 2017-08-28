require 'rest-client'

class OrderLinesController < ApplicationController
    before_action :set_order_line, only: [:show, :edit, :update, :destroy]

    # GET /order_lines
    # GET /order_lines.json
    def index
        @order_lines = current_user.orders.includes(:order_lines).where(closed: false).first.try(:order_lines) || []
    end

    # GET /order_lines/1
    # GET /order_lines/1.json
    def show
    end

    # GET /order_lines/new
    def new
        @order_line = OrderLine.new
    end

    # GET /order_lines/1/edit
    def edit
    end

    # POST /order_lines
    # POST /order_lines.json
    def create
        if current_user.current_order
            @order = current_user.current_order
        else
            last_order = Order.last
            order_no = ""
            if last_order
                order_no = last_order.order_no
                order_no = "A#{"#{(order_no[/\d+/].to_i + 1)}".rjust(5,'0')}"
            else
                order_no = "A#{"1".rjust(5,'0')}"
            end

            @order = current_user.orders.build(order_no: order_no, date: Time.now, closed: false)
        end
        product = Product.where(id: order_line_params[:product_id]).first
        merged = order_line_params.merge({:unit_price => product.price, :total_price => product.price * order_line_params[:qty].to_i})
        @order.order_lines.build(merged)

        respond_to do |format|
            if @order.save
                format.html { redirect_to products_path, notice: 'Order line was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    # PATCH/PUT /order_lines/1
    # PATCH/PUT /order_lines/1.json
    def update
        product = Product.where(id: order_line_params[:product_id]).first
        merged = order_line_params.merge({:unit_price => product.price, :total_price => product.price * order_line_params[:qty].to_i})
        respond_to do |format|
            if @order_line.update(merged)
                format.html { redirect_to @order_line, notice: 'Order line was successfully updated.' }
                format.json { render :show, status: :ok, location: @order_line }
            else
                format.html { render :edit }
                format.json { render json: @order_line.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /order_lines/1
    # DELETE /order_lines/1.json
    def destroy
        @order_line.destroy
        respond_to do |format|
            format.html { redirect_to order_lines_url, notice: 'Order line was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def finalize_cart
        order = Order.find(params[:order_id])
        # Randomly close the order
        finish_it = [true, false].sample

        if finish_it
            flash[:notice] = 'Order closed, thank you!'
            order.closed = true
            order.save!
        else
            flash[:error] = 'Your card was declined'
        end
        redirect_to cart_path
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_line
        @order_line = OrderLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_line_params
        params.require(:order_line).permit(:order_id, :product_id, :qty, :unit_price, :total_price)
    end
end
