class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
  

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :customer_id, :total_price)
  end

end
