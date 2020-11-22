class Customer::AddressesController < ApplicationController

before_action :authenticate_customer!

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @addresses = current_customer.address
      if @address.save
        redirect_to addresses_path
      else
        @addresses = current_customer.address
        render 'index'
      end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
      if @address.update(address_params)
        redirect_to addresses_path
      else
        render "edit"
      end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    @addresses = current_customer.address
      redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:zipcode, :address, :name)

  end
end
