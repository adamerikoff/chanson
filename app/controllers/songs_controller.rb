class SongsController < ApplicationController

  before_action :authorize, only: [:new, :create, :edit, :destroy, :update]

  def index
    @songs = Song.all()
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new()
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path, notice: "Song added!"
    else
      redirect_to new_song_path, alert: "Such song already exists!"
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song, notice: "Song updated!"
    else
      redirect_to edit_song_path(@song), alert: "Such song cannot be changed!"
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to songs_path, notice: "Song deleted!"
  end

  private
  def song_params
    artist_name = params[:song][:artist]
    album_name = params[:song][:album]
    genre_id = params[:song][:genre]
    song_audio = params[:song][:audio]

    pars = {}

    if !Artist.exists?(name: artist_name)
      Artist.create(name: artist_name, about: "To be added later...")
    end
    pars[:artist] = Artist.find_by(name: artist_name)
    if !Album.exists?(name: album_name)
      if params[:song][:single]
        album_name = "#{params[:song][:title]}-Single"
        Album.create(name: album_name, artist: pars[:artist])
      else
        Album.create(name: album_name, artist: pars[:artist])
      end
    end
    pars[:album] = Album.find_by(name: album_name)
    pars[:genre] = Genre.find(genre_id)
    pars[:title] = params[:song][:title]
    pars[:audio] = song_audio

    pars
  end

end
