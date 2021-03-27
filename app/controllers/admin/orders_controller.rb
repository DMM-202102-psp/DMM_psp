class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_detail = @order.order_items
    @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)

    if @order.status == "入金確認"
      @order_items.update_all(making_status: 1)
    end

    flash[:notice] = "注文ステータスを変更しました"
    redirect_to admin_order_path
  end


  def index
    @orders = Order.all
    @customers = Customer.all
    # @order_item = @order.order_item
  end
  
  def current_only
     @order = Order.where(customer_id: params[:id])
  end  

 private

    def order_params
      params.require(:order).permit(:postcode, :address, :name, :carriage, :term, :total_price, :status)
    end




end

