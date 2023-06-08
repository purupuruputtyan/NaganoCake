class Admin::OrderItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def update

  end

end