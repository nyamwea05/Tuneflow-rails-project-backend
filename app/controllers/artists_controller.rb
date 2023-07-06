class ArtistsController < ApplicationController
  wrap_parameters format: []
  def index
    artists = Artist.all
    render json: artists, status: :ok
  end

  def show
    artist = Artist.find_by(id: params[:id])
    render json: artist, status: :ok
  end

  def albums
    album = Album.find_by(id: params[:id])
    album_song = album.songs
    render json: album_song, status: :ok
  end
  private

  def artist_params
    params.permit(:name)
  end
end


# remember to change ruby version
