class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def create
    @item = Item.new
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(item_params)
  end

  # def new
  #   @item = Item.new
  # end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def top

  end

  private
  def item_params
    params.require(:item).permit(:explanation, :non_taxed_price, :image, :on_sale)
  end
end
