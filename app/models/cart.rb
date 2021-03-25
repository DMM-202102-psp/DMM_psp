class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def total
   ((self.item.price * 1.1).floor * self.quantity )
  end 

end
