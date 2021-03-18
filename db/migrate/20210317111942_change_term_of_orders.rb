class ChangeTermOfOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :term, :string, default: "0"
  end
end
