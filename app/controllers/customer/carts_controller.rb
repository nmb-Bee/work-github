class Customer::CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def create
    @cart = Cart.new(cart_params)
    # @cart.customer_id = current_customer.id
    if @cart.save
    redirect_to carts_path
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
    # @carts = current_customer.cart
    @carts.destroy_all
    redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:item_id, :quantity)
  end

end
