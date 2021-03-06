class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!


  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     redirect_to admin_customers_path
    else
      render "edit"
    end
  end
end

private

def customer_params
  params.require(:customer).permit(:postcode, :email, :encrypted_password, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :is_valid)
end
