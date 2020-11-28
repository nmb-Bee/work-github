class Order < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :order_items

  enum payment: {"クレジットカード": 0, "銀行振込": 1}
  enum order_status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}

  def sub_price
    sum = 0
    self.order_items.each do |order_item|
      sum += order_item.purchase_price*order_item.quantity
    end
    return sum
  end

end