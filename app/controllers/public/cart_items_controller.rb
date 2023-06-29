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
      if @cart_item.save
        flash[:notice] = "カートに入りました。"
        redirect_to cart_items_path
      else
        render 'public/items/show'
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "商品の数量を変更しました。"
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end

end
