class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.where(customer: current_customer)
  end

  def log
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
end
