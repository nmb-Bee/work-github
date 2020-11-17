class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new
    # エラー等のメッセージは必要か？
    if @genre.save
    redirect_to genre_path(@genre.id)
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    # エラー等のメッセージは必要か？
    if @genre.update(genre_params)
      redirect_to genre_path(@genre)
    else
      render "edit"
    end

  end

  private

  def genre_params
    params.require(:genre).permit(:directed_graph)
  end

end
