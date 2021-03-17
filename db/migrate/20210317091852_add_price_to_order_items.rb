class AddPriceToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :price, :integer
    add_column :order_items, :order_id, :integer
    add_column :order_items, :item_id, :integer
    add_column :order_items, :quantity, :integer
    add_column :order_items, :making_status, :integer
  end
end
