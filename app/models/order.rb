class Order < ApplicationRecord
  has_many :order_items
  belongs_to :customer
  enum term: { クレジットカード: 1, 銀行振込: 2}
end
