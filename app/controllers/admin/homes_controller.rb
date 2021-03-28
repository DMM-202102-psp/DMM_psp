class Admin::HomesController < ApplicationController
    before_action :authenticate_admin!

  def top
    @orders = Order.order(updated_at: :desc).page(params[:page]).per(10)
    # @customer = Customer.find(params[:id])
  end

  private

    def order_params
      params.require(:order).permit(:postcode, :address, :name, :carriage, :term, :total_price, :status)
    end

end
