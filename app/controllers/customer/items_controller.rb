class Customer::ItemsController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all
  end

  def about
  end

  def index
    @genres = Genre.all
    @items = Item.all

  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  private
  def items_params
    params.require(:item).permit(:explanation, :non_taxed_price, :image, :on_sale, :genre_id)
  end


end
