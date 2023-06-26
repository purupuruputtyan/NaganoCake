class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    if @cart_item
      new_amount = @cart_item.amount + cart_item_params[:amount]
      @cart_item.update(amount: new_amount)
      redirect_to cart_items_path
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.item_id = @item.id
      if @cart_item.save
        flash[:notice] = "カートに入りました。"
        redirect_to cart_items_path
      else
        render 'public/items/show'
      end
    end
  end

  def index

  end

  def update

  end

  def destroy

  end

  def destroy_all

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end

end
