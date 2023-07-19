class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    if @order.update(order_params)
       if @order.status == "payment_confirmation"
          @order_items.update_all(making_status: 1)
       elsif @order.status == "delivered"
          @order_items.update_all(making_status: 3)
       end
       redirect_to admin_order_path(@order), notice: "注文ステータスを変更しました"
    else
      render :show
    end
  end

private
  def order_params
    params.require(:order).permit(:status)
  end

end
