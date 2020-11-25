class Customer::CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
    redirect_to carts_path
    end
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  private

  def cart_params
    params.require(:cart).permit(:customer_id, :item_id, :quantity)
  end

end
