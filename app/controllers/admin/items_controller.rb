class Admin::ItemsController < ApplicationController

  def new

  end

  def index

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def item_params
    params.require(:post).permit(:image, :shop_name, :address, :latitude, :longitude, :menu, :impression, :price, :volume_status, :star)
  end

end
