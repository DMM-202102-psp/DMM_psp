class AddPostcodeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :postcode, :string
    add_column :orders, :customer_id, :integer
    add_column :orders, :address, :string
    add_column :orders, :name, :string
    add_column :orders, :carriage, :integer
    add_column :orders, :term, :string
    add_column :orders, :total_price, :integer
    add_column :orders, :status, :integer
  end
end
