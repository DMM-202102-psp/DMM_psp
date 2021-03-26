class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
     @customer = current_customer
  end

  def update
     @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  def unsubscribe
    @customer = Customer.find_by(params[:id])
  end

  private
  def customer_params
  params.require(:customer).permit(:postcode, :email, :encrypted_password, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :is_valid)
  end
end
