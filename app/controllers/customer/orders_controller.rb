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
      @order.name = current_customer.family_name + current_customer.first_name

    elsif params[:address_option] == "addresses" 
      #登録済住所から選択
      @order.zipcode = Address.find(params[:select]).zipcode
      @order.address = Address.find(params[:select]).address
      @order.name = Address.find(params[:select]).family_name + Address.find(params[:select]).first_name
    end
    
    @order.payment = "クレジットカード"
  end

  def create
    @order = Order.new(order_params)
    # もし情報入力でnew_addressの場合Addressに保存
    if params[:order][:address] == "new_address"
      current_customer.address.create(address_params)
    end

    # カート商品の情報を注文商品に移動
    @carts = current_cart
    @carts.each do |cart|
    OrderDetail.create(
      product:  cart.items,
      order:    @order,
      quantity: cart.quantity,
      subprice: sub_price(cart)
    )
    end
    # 注文完了後、カート商品を空にする
    @carts.destroy_all
    if @order.save
      @carts = current_customer.carts
      @carts.destroy_all
      redirect_to thanks_orders_path
    else
      @order.customer_id = current_customer.id
      @customer = current_customer
      render :new
    end
  end

  def thanks
  end

  def index
      @order = Order.where(customer_id: current_customer.id).order(created_at: :desc)

  end

  def show
    #@order = Order.find(params[:id])
    #@order_details = @order.order_details
  end
  
  private
    def address_params
      params.require(:order).permit(:zipcode, :address, :name)
    end
    
    def order_params
      params.require(:order).permit(:customer_id, :name, :zipcode, :address, :payment, :shipfee, :order_status)
    end
end
