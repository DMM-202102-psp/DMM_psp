class ChangeDataTermToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :term, :integer
  end
end
