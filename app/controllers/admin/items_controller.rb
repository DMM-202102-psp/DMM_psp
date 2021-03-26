class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(10)

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to "item_path(item)", notice: "商品登録完了しました"
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :genre_id, :price, :is_active)
  end
end
