class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
  end

  def update
  end

  def index
    @orders = Order.all
    @customers = Customer.all
    # @order_item = @order.order_item
  end

end
