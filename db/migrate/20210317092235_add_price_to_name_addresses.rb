class AddPriceToNameAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :name, :string
    add_column :addresses, :customer_id, :integer
    add_column :addresses, :postcode, :string
    add_column :addresses, :adress, :string
   
  end
end
