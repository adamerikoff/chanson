class ArtistsController < ApplicationController

  before_action :authorize, only: [:new, :create, :edit, :destroy, :update]
  
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new()
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path, notice: "New artist added!"
    else
      redirect_to new_artist_path, alert: "#{@artist.name} already exists!"
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to @artist, notice: "Artist updated!"
    else
      redirect_to edit_artist_path(@artist), alert: "Such artist already exists!"
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.albums.each do |album|
      album.destroy
    end
    @artist.destroy

    redirect_to artists_path, notice: "Artist deleted!"
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :about, :avatar)
  end
end
