class SongsController < ApplicationController

  def index
  	@songs = Song.all
  end

  def show
  	@song = Song.find(params[:id])
  end

  def new
  	@song = Song.new
  end

  def create
  name = params[:song][:name]
  artist_id = params[:song][:artist_id]
  genre_id = params[:song][:genre_id]

  song = Song.create(name: name, artist_id: artist_id, genre_id: genre_id)
  redirect_to song_path(song)
end

def update
  @song = Song.find(params[:id])
  @song.update(params.require(:song).permit(:name))
  redirect_to song_path(@song)
end

def edit
  @song = Song.find(params[:id])
end
end
