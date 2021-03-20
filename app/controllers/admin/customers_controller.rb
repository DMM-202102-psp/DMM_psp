class Admin::CustomersController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  # def edit
  # end

  def update
     @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_back(fallback_location: root_url)
  end
end

private

  def customer_params
    params.require(:customer).permit(:postcode, :email, :encrypted_password, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :is_valid)
  end
