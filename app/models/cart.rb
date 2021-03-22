class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def total_price
   items.to_a.sum { |item| item.total_price }
  end 
  
end
