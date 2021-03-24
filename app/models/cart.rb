class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  # def total_price
  # self.item.price * self.quantity * 1.1
  # end

end
