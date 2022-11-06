class GenresController < ApplicationController
  
  before_action :authorize, only: [:new, :create, :edit, :destroy, :update]
  
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new()
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path, notice: "New genre added!"
    else
      redirect_to new_genre_path, alert: "#{@genre.name} already exists!"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to @genre, notice: "Genre updated!"
    else
      redirect_to edit_genre_path(@genre), alert: "Such genre already exists!"
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy

    redirect_to genres_path, notice: "Genre deleted!"
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
