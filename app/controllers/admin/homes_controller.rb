class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.all
    # @customer = Customer.find(params[:id])
    @items = Item.all
     @items = Item.page(params[:page]).per(10)
  end
end
