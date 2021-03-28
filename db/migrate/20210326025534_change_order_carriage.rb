class ChangeOrderCarriage < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :carriage, :integer, :default => 800
  end
end
