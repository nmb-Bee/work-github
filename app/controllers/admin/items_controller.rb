class Admin::ItemsController < ApplicationController
  def top
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(item_params)
  end

  # def new
  #   @item = Item.new
  # end

  def create
    @item = Item.new
  end

  def edit
    @item = Item.find(item_params)
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:explanation, :non_taxed_price, :image, :on_sale)
  end
end
