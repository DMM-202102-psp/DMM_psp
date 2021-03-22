class Public::CustomersController < ApplicationController
  def show

  end

  def edit
     @customer = current_customer
  end

  def update
     @customer = current_customer
    if @customer.update(customer_params)
      redirect_to request.referer
    else
      render :edit
    end
  end

  def withdrawal
  end

  def unsubscribe
  end

  private
  def customer_params
  params.require(:customer).permit(:postcode, :email, :encrypted_password, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :is_valid)
  end
end
