class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.all
    # @customer = Customer.find(params[:id])
    @items = Item.page(params[:page]).per(10)
  end

  def item_params
    params.require(:item).permit(:image_id, :name, :description, :genre_id, :price, :is_active)
  end
end
