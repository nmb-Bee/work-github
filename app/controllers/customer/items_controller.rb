class Customer::ItemsController < ApplicationController
  MAX_DISPLAY_RELATED_PRODUCTS = 4

  def top
    @genres = Genre.all
    @items =Item.limit(8).offset(4)
    # @item = Item.find(params[:id])
    # @items = Item.in_taxons(@item.taxons)
    # distinct.where.not(id: @item.id).sample(MAX_DISPLAY_RELATED_PRODUCTS)
  end

  def about
  end

  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).per(5)

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
