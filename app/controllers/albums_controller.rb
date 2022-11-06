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
    @val = ""
  end

  def create
    if Artist.exists?(name: params[:album][:artist])
      artist = Artist.find_by(name: params[:album][:artist])
      if Album.new(name: params[:album][:name], release_date: params[:album][:release_date], cover: params[:album][:cover], artist: artist).save
        redirect_to albums_path, notice: "Album added!"
      else
        redirect_to new_album_path, alert: "#{album.name} already exists!"
      end
    else
      artist = Artist.new(name: params[:album][:artist], about: "To be added later...")
      if artist.save
        if Album.new(name: params[:album][:name], release_date: params[:album][:release_date], cover: params[:album][:cover], artist: artist).save
          redirect_to edit_artist_path(artist), notice: "Please update artist information!"
        else
          redirect_to new_album_path, alert: "#{album.name} already exists!"
        end
      else
        redirect_to new_album_path, alert: "Unexpected error!"
      end
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @val = @album.artist.name
    @album = Album.find(params[:id])
    if params[:album][:cover] == nil
      params[:album][:cover] = @album.cover.blob
    end
    if Artist.exists?(name: params[:album][:artist])
      artist = Artist.find_by(name: params[:album][:artist])
      if @album.update(name: params[:album][:name], release_date: params[:album][:release_date], cover: params[:album][:cover], artist: artist)
        redirect_to @album, notice: "Album updated!"
      else
        redirect_to edit_album_path(@album), alert: "#{@album.name} already exists!"
      end
    else
      artist = Artist.new(name: params[:album][:artist], about: "To be added later...")
      if artist.save
        if @album.update(name: params[:album][:name], release_date: params[:album][:release_date], cover: params[:album][:cover], artist: artist)
          redirect_to edit_artist_path(artist), notice: "Please update artist information!"
        else
          redirect_to new_album_path, alert: "#{album.name} already exists!"
        end
      else
        redirect_to new_album_path, alert: "Unexpected error!"
      end
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to albums_path, notice: "Album deleted!"
  end

end
