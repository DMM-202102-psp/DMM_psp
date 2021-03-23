class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
  end

  private

  def item_params
    params.require(:item).permit(:image_id, :name, :description, :genre_id, :price, :is_active)
  end

  # def cart_params
  #   params.require(:cart).permit(:item_id, :customer_id, :quantity, :price)
  # end
  
  
  
end
