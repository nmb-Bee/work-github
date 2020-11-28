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
      if params[:addresses].blank?
        render :new
        return
      end
        #登録済住所から選択
        @order.zipcode = Address.find(params[:addresses]).zipcode
        @order.address = Address.find(params[:addresses]).address
        @order.name = Address.find(params[:addresses]).name
      else params[:address_option] == "new_address"
        @order.zipcode = params[:zipcode]
        @order.address = params[:address]
        @order.name = params[:name]
    end

    @order.payment = params[:payment_method]
    @order.shipfee = 800

  end

  def create
    @order = Order.new(order_params)
    @order.total_price = current_customer.total_price * 1.10 + @order.shipfee
    @order.customer_id = current_customer.id
    @order.save!
    # もし情報入力でnew_addressの場合Addressに保存
    if params[:address_option] == "new_address"
      current_customer.addresses.create(address_params)
    end

    # カート商品の情報を注文商品に移動
    @carts = current_customer.carts
    @carts.each do |cart|
    # OrderItem.create(purchase_price: cart.item.non_taxed_price, order_id: @order.id, item_id: cart.item.id, quantity: cart.quantity)
    @order_item = OrderItem.new
    @order_item.purchase_price = cart.item.non_taxed_price
    @order_item.order_id = @order.id
    @order_item.item_id  = cart.item.id
    @order_item.quantity = cart.quantity
    @order_item.save
    end

    # 注文完了後、カート商品を空にする
  # @carts.destroy_all
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
      @orders = Order.all
      #Order.where(customer_id: current_customer.id).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_status = @order.order_status
  end

  private
    def address_params
      params.require(:order).permit(:zipcode, :address, :name)
    end

    def order_params
      params.require(:order).permit( :name, :zipcode, :address, :payment, :shipfee, :order_status)
    end
end
