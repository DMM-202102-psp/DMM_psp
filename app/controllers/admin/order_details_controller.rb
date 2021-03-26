class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderItem.find(params[:id])#order_itemsのIDをとってくる。
    @order = @order_detail.order
    @order_detail.update(order_items_params)

    if @order_detail.making_status == "製作中"
      @order.update(status: 2)
    end
    if @order.order_items.count == @order.order_items.where(making_status: "製作完了").count
      @order.update(status: 3)
    end


    flash[:notice] = "製作ステータスを更新しました"
    redirect_to admin_order_path(@order_detail.order)
  end

  private

  def order_items_params
    params.require(:order_item).permit(:making_status)
  end

  def order_params
    params.require(:order).permit(:postcode, :address, :name, :carriage, :term, :total_price, :status)
  end

end
