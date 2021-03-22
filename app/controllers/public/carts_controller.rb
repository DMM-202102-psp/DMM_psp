class Public::CartsController < ApplicationController
  def index
   @carts = current_customer.carts
  end

  def update
    @cart = Cart.find(params[:id])
		@cart.update(cart_params)
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end

  def destroy_all
    @cart = Cart.find(params[:id])
    @cart.destroy_all
  end

  def create
    @carts = current_customer.carts
    @cart = Cart.new(cart_params)
  end


private

  def cart_params
    params.require(:cart).permit(:item_id, :customer_id, :quantity, :price)
  end
  
end