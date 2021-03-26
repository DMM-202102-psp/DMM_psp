class Public::OrdersController < ApplicationController
  include ApplicationHelper
   before_action :authenticate_customer!

  def new
    @order = Order.new
    @address = Address.new
    @addresses = Address.all
    @carts = current_customer
    # @custmer = current_customer
  #   params.require(:customer).permit(:postcode, :address, :last_name, :first_name)
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_selection] == "myaddress"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_selection] == "entryaddress"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_selection] == "addaddress"
      @address = Address.new
      # @address = Address.find(params[:order][:address_id])
      @address.postcode = @order.postcode
      @address.address = @order.address
      @address.name = @order.name
      @address.customer_id = current_customer.id
      @address.save
    end
    @carts = current_customer.carts
    @order.total_price = (total_price(@carts) + 800).to_i
    @order.term = params[:order][:term]
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @order_items = current_customer.carts
     @order_items.each do |cart|
        order_item = @order.order_items.new
        order_item.item_id = cart.item.id
        order_item.price = cart.item.price
        order_item.quantity = cart.quantity
        order_item.save #38~44 カートの中身を保存
        end
    current_customer.carts.destroy_all #カートの中身を削除
    redirect_to orders_complete_path #確認の為現状は注文履歴へ遷移
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order.term = params[:order][:term]
  end

  private

    def order_params
      params.require(:order).permit(:postcode, :address, :name, :carriage, :term, :total_price, :status)
    end

    def set address
      @address = Address.find(params[:id])
    end


end
