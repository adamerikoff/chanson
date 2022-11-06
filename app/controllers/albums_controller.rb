class AlbumsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :destroy, :update]
  
  def index
    @albums = Album.first(20)
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new()
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path, notice: "Song added!"
    else
      redirect_to new_album_path, alert: "Such album already exists!"
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    album_name = params[:album][:name]
    release_date = params[:album][:release_date]
    album_cover = params[:album][:cover]
    artist = @album.artist
    if params[:album][:cover] == nil
      album_cover = @album.cover[0]
    end
    if @album.update(name: album_name, artist: artist, release_date: release_date, cover: album_cover)
      redirect_to @album, notice: "Genre updated!"
    else
      redirect_to edit_album_path(@genre), alert: "Such album already exists!"
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to albums_path, notice: "Album deleted!"
  end

  private
  def album_params
    pars = {}
    
    album_name = params[:album][:name]
    release_date = params[:album][:release_date]
    artist_name = params[:album][:artist]
    album_cover = params[:album][:cover]

    if !Artist.exists?(name: artist_name)
      Artist.create(name: artist_name, about: "To be added later...")
    end
    
    pars[:artist] = Artist.find_by(name: artist_name)
    pars[:name] = album_name
    pars[:release_date] = release_date
    pars[:cover] = album_cover

    pars
  end
end
