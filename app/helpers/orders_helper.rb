module OrdersHelper
  def tax_price(a)
    a * 1.1
  end

  def sub_price(b)
    b.order_item.non_taxed_price * b.quantity
  end
end