class Item < ApplicationRecord
  has_many :carts
  has_many :order_items
  belongs_to :genre
  attachment :image
validates :name, presence: true, uniqueness: true
validates :price, presence: true, numericality: true

end
