class Admin::HomesController < ApplicationController
  def top
    @items = Item.all
    # @customer = Customer.find(params[:id])
  end
end
