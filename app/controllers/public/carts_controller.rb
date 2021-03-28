class Public::CartsController < ApplicationController
  before_action :authenticate_customer!
 
  
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
      if @cart.save
       redirect_to carts_path, flash: {success: "商品をカートに追加しました"}
      else flash[:danger] = "個数を選択してください"
			 redirect_back(fallback_location: root_url)
		  end
    # else
  #   @cart = current_customer.carts.find_by(item_id: params[:cart][:item_id])
  #   @cart.item.quantity += params[:quantity].to_i
  #   @cart.save
  # end  
  end
  
  def update
    @cart = Cart.find(params[:id])
		@cart.update(cart_params)
		redirect_to '/carts',  flash: {success: "商品の数量を変更しました"}
  end

  def destroy
    @cart = Cart.find_by(params[:id])
    @cart.destroy
    redirect_to '/carts', flash: {danger: "商品を削除しました"}
  end

  def destroy_all
    @cart = current_customer.carts
    @cart.destroy_all
    redirect_to '/carts', flash: {danger: "カートを空にしました"}
  end

private

  def cart_params
    params.require(:cart).permit(:item_id, :customer_id, :quantity)
  end
  
end