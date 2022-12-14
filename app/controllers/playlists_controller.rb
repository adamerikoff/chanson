class PlaylistsController < ApplicationController

  before_action :authorize, only: [:new, :create, :edit, :destroy, :update]
  
  def index
    @playlists = Playlist.first(20)
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new()
  end

  def create
    @playlist = Playlist.new(name: params[:playlist][:name], user: current_user)
    if @playlist.save
      redirect_to playlists_path, notice: "Playlist added!"
    else
      redirect_to new_playlist_path, arlert: "Playlist already exists!"
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(name: params[:playlist][:name], user: current_user)
      redirect_to @playlist, notice: "Playlist updated!"
    else
      redirect_to edit_playlist_path, arlert: "Please enter different playlist name."
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    redirect_to playlists_path, notice: "Playlists deleted!"
  end

  def song_to_playlist_new
    @song = Song.find(params[:song_id])
  end

  def add_song_to_playlist
    song_id = params[:song]
    playlist_id = params[:playlist]
    song = Song.find(song_id)
    playlist = Playlist.find(playlist_id)
    temp = PlaylistSong.new(playlist: playlist, song: song)
    if temp.save
      redirect_to playlists_path, notice: "Successfuly added song to playlist!"
    else
      redirect_to playlist_song_path(song), alert: "Failed!"
    end
  end

end
