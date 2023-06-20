class Public::CustomersController < ApplicationController
  
  def index
  end

  def show
    
  end

  def edit
    
  end
  
  def update
    
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :address, :phone_number)
  end
end
