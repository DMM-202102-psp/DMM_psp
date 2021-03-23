class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
    @addresses = Address.all
    # @custmer = current_customer
  #   params.require(:customer).permit(:postcode, :address, :last_name, :first_name)
  end

  def confirm
    @order = Order.new(order_params)
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def complete
  end

  def index
  end

  def show
  end

  private

    def order_params
      params.require(:order).permit(:postcode, :address, :name, :carriage, :term, :total_price, :status)
    end

end
