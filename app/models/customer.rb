class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :orders
  has_many :addresses

  # 名前（姓）のバリデーション
   validates :last_name, presence: true, format: { with:/\A[一-龥ぁ-ん]/ }
  #名前（名）のバリデーション
   validates :last_name, presence: true, format: { with:/\A[一-龥ぁ-ん]/ }
  #フリガナ（セイ）のバリデーション
   validates :last_name_kana, presence: true, format: { with:/\A[ァ-ヶー－]+\z/ }
  #フリガナ（メイ）のバリデーション
   validates :last_name_kana, presence: true, format: { with:/\A[ァ-ヶー－]+\z/ }
  #電話番号（ハイフンなし）のバリデーション
   validates :phone_number, presence: true, format: { with:/\A\d{10,11}\z/ }
  #住所のバリデーション
   validates :address, presence: true
  # 郵便番号（ハイフンなし）のバリデーション
  validates :postcode, presence: true, format: { with: /\A\d{7}\z/ }
end
