class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path
  end

  def quit
  end

  def out
  end
  
  private

  def customer_params
    params.require(:customer).permit(:family_name, :family_name_kana, :first_name, :first_name_kana, :phone_number, :zipcode, :address, :email, :is_deleted)
  end
end