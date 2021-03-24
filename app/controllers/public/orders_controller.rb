class Public::OrdersController < ApplicationController
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
    if params[:order][:address] == "myaddress"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address] == "entryaddress"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address] == "addaddress"
      @addressnew = Address.new
      # @addressnew = Address.find(params[:order][:address_id])
      @order.postcode = @addressnew.postcode
      @order.address = @addressnew.address
      @order.name = @addressnew.name
    end
    @carts = current_customer.carts
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to complete_order_path
    #カートの中身をorder_detailに保存する作業を入れる
    #カートの中身を削除する作業が必要
    #終わった後のリダイレクト先を→完了画面
  end

  def complete
  end

  def index
    @orders = Order.all

  end

  def show
  end

  private

    def order_params
      params.require(:order).permit(:postcode, :address, :name, :carriage, :term, :total_price, :status)
    end

    def set address
      @address = Address.find(params[:id])
    end


end
