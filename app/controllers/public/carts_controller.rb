class Public::CartsController < ApplicationController
  
  def index
   @carts = current_customer.carts
   @cart = Cart.new
  end

  def create
    
  # if @cart.blank?
      @cart = Cart.new
      @cart.customer_id = current_customer.id
      @cart.item_id = params[:cart][:item_id]
      @cart.quantity = params[:cart][:quantity]
      @cart.save
  # else
  #   @cart = current_customer.carts.find_by(item_id: params[:cart][:item_id])
  #   @cart.item.quantity += params[:quantity].to_i
  #   @cart.save
    redirect_to carts_path
  # end  
  end
  
  def update
    @cart = Cart.find(params[:id])
		@cart.update(cart_params)
		redirect_to '/carts'
  end

  def destroy
    @cart = Cart.find_by(params[:id])
    @cart.destroy
    redirect_to '/carts'
  end

  def destroy_all
    @cart = current_customer.carts
    @cart.destroy_all
    redirect_to '/carts'
  end

  


private

  def cart_params
    params.require(:cart).permit(:item_id, :customer_id, :quantity)
  end
  
end