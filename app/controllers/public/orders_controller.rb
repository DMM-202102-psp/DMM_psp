class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    params.require(:customer).permit(:postcode, :address, :last_name, :first_name)
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
end
