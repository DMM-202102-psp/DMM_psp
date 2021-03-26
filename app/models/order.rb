class Order < ApplicationRecord
  has_many :order_items
  belongs_to :customer
  enum term: { クレジットカード: 0, 銀行振込: 1}
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中:2, 発送準備中:3, 発送済:4}
  def full_address
    self.postcode + self.address + self.name
  end
  
   validates :term, presence: true
   validates :postcode, presence: true
   validates :address, presence: true
   validates :name, presence: true
end
