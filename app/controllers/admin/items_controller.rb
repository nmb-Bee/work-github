class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(5)
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to admin_items_path
    else
      render :edit
    end
  end

  def top
   now = Time.current
   @orders = Order.where(created_at: now.all_day)
  end

  private
  def item_params
    params.require(:item).permit(:explanation, :non_taxed_price, :image, :on_sale, :genre_id, :name)
  end
end
