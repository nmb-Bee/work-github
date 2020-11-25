class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.where(customer: current_customer)
    
  end

  def log
    @carts = Cart.all
		@order = Order.new
		
		if params[:address_option] == "address" 
      #ご自身の住所
      @order.zipcode = current_customer.zipcode
      @order.address = current_customer.address
      @order.name = current_customer.name
      
    elsif params[:address_option] == "addresses" 
      #登録済住所から選択
      @order.zipcode = Address.find(params[:select]).zipcode
      @order.address = Address.find(params[:select]).address
      @order.name = Address.find(params[:select]).name
    end
    
  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end
  
  private
  def address_params
    params.require(:order).permit(:zipcode, :address, :name)
  end
  
  def order_params
    params.require(:order).permit(:customer_id, :name, :zipcode, :address, :payment, :shipfee, :order_status)
  end
  
end