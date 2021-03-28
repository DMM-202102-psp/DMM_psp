class Public::HomesController < ApplicationController
  def top
     @items = Item.all
     @items = Item.all.order(:id)
      @items = Item.page(params[:page]).per(4)
  end

  def about
  end

  private

  def item_params
    params.require(:item).permit(:image_id, :name, :description, :genre_id, :price, :is_active)
  end
end
