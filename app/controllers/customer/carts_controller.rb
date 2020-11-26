class Customer::CartsController < ApplicationController
  def index
    @carts = current_customer.carts
    @total_price = 0
		@carts.each do |cart|
			@total_price += cart.item.non_taxed_price * cart.quantity
		end
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
    # @carts = current_customer.carts
    @already = current_customer.carts.find_by(item_id: @cart.item_id)
    if @already.present?
      new_quantity = @already.quantity + @cart.quantity
      @already.update_attribute(:quantity, new_quantity)
    else
      @cart.save
    end
    redirect_to carts_path
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