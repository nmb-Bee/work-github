class Customer::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def quit
  end

  def out
    @customer = Customer.find(params[:id])
    # defaultがtrueになってしまったのでfalseで退会
    @customer.update(is_deleted: false)
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
