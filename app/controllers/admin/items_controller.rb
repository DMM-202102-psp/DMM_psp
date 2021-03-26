class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

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
<<<<<<< HEAD
    redirect_to "items_path", notice: "商品登録完了しました"
=======
    redirect_to admin_item_path(@item), notice: "商品登録完了しました"
>>>>>>> 5cad5daef204ea2ef752674a28df5dad729cd474
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render "edit"
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :genre_id, :price, :is_active)
  end
end
