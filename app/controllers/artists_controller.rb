class ArtistsController < ApplicationController

  def index
  	@artists = Artist.all
  end

  def show
  	@artist = Artist.find(params[:id])
  end

  def new
  	@artist = Artist.new
  end

  def create
  name = params[:artist][:name]
  bio = params[:artist][:bio]
  artist = Artist.create(name: name, bio: bio)

  redirect_to artist_path(artist)
end

def update
  @artist = Artist.find(params[:id])
  @artist.update(params.require(:artist).permit(:name, :bio))
  redirect_to artist_path(@artist)
end

def edit
  @artist = Artist.find(params[:id])
end
end
