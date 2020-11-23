class Customer::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def quit
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    # ログアウトしてトップページに飛ぶ 
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :family_name_kana, :first_name, :first_name_kana, :phone_number, :zipcode, :address)
  end
end
