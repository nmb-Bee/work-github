class Customer::CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
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
    params.permit(:item_id, :quantity)
  end

end
