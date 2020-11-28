class Item < ApplicationRecord

  has_many :carts
	has_many :order_items
	belongs_to :genre

	attachment :image

  def status
    if on_sale == true
      "販売中"
    else
      "販売停止"
    end
  end

end
