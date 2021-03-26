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
    @order.update(order_params)
      redirect_to admin_order_path

  end


  def index
    @orders = Order.all
    @customers = Customer.all
    # @order_item = @order.order_item
  end

 private

    def order_params
      params.require(:order).permit(:postcode, :address, :name, :carriage, :term, :total_price, :status)
    end




end

