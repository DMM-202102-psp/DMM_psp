class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = OrderItem.find(params[:id])#order_itemsのIDをとってくる。
    @order = @order_detail.order
    @order_detail.update(order_items_params)

    redirect_to admin_orders_path
  end

  private

  def order_items_params
    params.require(:order_item).permit(:making_status)
  end

  def order_params
    params.require(:order).permit(:postcode, :address, :name, :carriage, :term, :total_price, :status)
  end

end
