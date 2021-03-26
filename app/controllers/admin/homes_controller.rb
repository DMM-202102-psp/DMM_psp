class Admin::HomesController < ApplicationController
    before_action :authenticate_admin!

  def top
    @items = Item.all
    # @customer = Customer.find(params[:id])

    @items = Item.page(params[:page]).per(10)
  end

  def item_params
    params.require(:item).permit(:image_id, :name, :description, :genre_id, :price, :is_active)

  end
end
