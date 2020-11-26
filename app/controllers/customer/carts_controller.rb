class Customer::CartsController < ApplicationController
  def index
    @carts = Cart.all
    @total_price = 0
		@carts.each do |cart|
			@total_price += cart.item.non_taxed_price * cart.quantity
		end
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
    @carts = Cart.all
    @carts.each do |cart|
    if cart.item_id == @cart.item_id
      new_quantity = cart.quantity + @cart.quantity
      cart.update_attribute(:quantity, new_quantity)
      @cart.delete
    end
    if @cart.save
    redirect_to carts_path
    end
  end
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to carts_path
    else render 'index'
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    if @cart.destroy
      redirect_to carts_path
    else render 'index'
    end
  end

  def all_destroy
    Cart.destroy_all
    redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:item_id, :quantity)
  end
end