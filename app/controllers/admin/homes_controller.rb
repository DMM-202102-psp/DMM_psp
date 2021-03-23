class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.all
    # @customer = Customer.find(params[:id])
  end
end
