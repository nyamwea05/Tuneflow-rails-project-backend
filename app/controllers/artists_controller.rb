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

  def albumsong
    artist = Artist.find(params[:id])
    artist_songs = artist.songs
    render json: artist_songs
  end
  private

  def artist_params
    params.permit(:name)
  end
end


# remember to change ruby version
