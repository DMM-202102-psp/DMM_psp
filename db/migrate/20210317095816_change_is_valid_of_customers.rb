class ChangeIsValidOfCustomers < ActiveRecord::Migration[5.2]
  def change
     change_column :customers, :is_valid, :boolean, default: "true"
  end
end
