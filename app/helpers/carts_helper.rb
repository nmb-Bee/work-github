module CartsHelper
  def tax_price(a)
    a*1.1
  end

  def sub_price(b)
    b.item.non_taxed_price * b.quantity
  end
end
