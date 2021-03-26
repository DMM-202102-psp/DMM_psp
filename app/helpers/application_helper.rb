module ApplicationHelper
  def tax_price(price)
    (price * 1.1).floor
  end

  def sub_price(sub) #小計の計算
    (tax_price(sub.item.price) * sub.quantity)
  end

  def total_price(totals) #合計金額
    price = 0
    totals.each do |total|
      price += sub_price(total)
    end
    return price
  end

  def billing #請求金額
    total_price(current_customer.orders) + 800
  end


end
