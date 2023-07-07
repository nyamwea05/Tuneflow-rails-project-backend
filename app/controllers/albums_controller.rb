class AlbumsController < ApplicationController
  def index
    albums = Album.all
    render json: albums, status: :ok
  end

  def show
    album = Album.find_by(id: params[:id])
    if album
      render json: album, status: :ok

    else
      render json: {error: "album not found"}, status: :not_found
    end
  end

  def albumsong
    album = Artist.find(params[:id])
    album_songs = album.songs
    render json: album_songs
  end

  private

  def album_params
    params.permit(:name, :album_image_url, :description)

  end
end

