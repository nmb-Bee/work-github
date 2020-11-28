class Customer::ItemsController < ApplicationController
  MAX_DISPLAY_RELATED_PRODUCTS = 4

  def top
    @genres = Genre.where(directed_graph: true)
    # @items =Item.limit(8).offset(4)
    @items = Item.all
  end

  def about
  end

  def index
    @genres = Genre.where(directed_graph: true)
    @items = Item.page(params[:page]).per(4)

  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.where(directed_graph: true)
    @cart = Cart.new
  end

  private
  def items_params
    params.require(:item).permit(:explanation, :non_taxed_price, :image, :on_sale, :genre_id)
  end
end
