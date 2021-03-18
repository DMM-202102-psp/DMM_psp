class ChangeMakingStatusOfOrderItems < ActiveRecord::Migration[5.2]
  def change
    change_column :order_items, :making_status, :integer, default: "0"
  end
end
