module OrdersHelper
  def tax_price(a)
<<<<<<< HEAD
    a * 1.1
=======
    a* 1.1
>>>>>>> origin/develop
  end

  def sub_price(b)
    b.order_item.non_taxed_price * b.quantity
  end
end