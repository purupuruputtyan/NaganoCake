class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "編集が成功しました。"
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :post_code,
      :address,
      :phone_number,
      :email,
      :is_deleted
    )
  end

end
