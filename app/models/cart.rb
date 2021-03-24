class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def total
   self.item.price * self.quantity * 1.1
  end 
  
end
