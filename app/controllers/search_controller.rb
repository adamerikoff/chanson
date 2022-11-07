class SearchController < ApplicationController
  def index
  end

  def get
    @genres = Genre.all.where("lower(name) LIKE :data", data: "#{params[:data]}")
    @songs = Song.all.where("lower(title) LIKE :data", data: "#{params[:data]}")
    @artists = Artist.all.where("lower(name) LIKE :data", data: "#{params[:data]}")
    @albums = Album.all.where("lower(name) LIKE :data", data: "#{params[:data]}")
    @playlists = Playlist.all.where("lower(name) LIKE :data", data: "#{params[:data]}")
  end
  
  def search
    data = params[:search]
    redirect_to search_get_path(data)
  end
end
