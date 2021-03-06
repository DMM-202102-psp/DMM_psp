class Public::AddressesController < ApplicationController
   before_action :authenticate_customer!
  
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @addresses = Address.all
      @address.save
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
      @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postcode, :address)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
