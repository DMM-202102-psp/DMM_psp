class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
    @addresses = Address.all
    # @custmer = current_customer
  #   params.require(:customer).permit(:postcode, :address, :last_name, :first_name)
  end

  def confirm
  end

  def complete
  end

  def create
    @order = Order.new(item_params)
     @order.save!
  end

  def index
  end

  def show
  end

  # private
  # def order_params
  #   params.require(:book).permit(:postcode, :address, :name)
  # end

end
