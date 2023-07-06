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

  def songs
    # song = find_by(id: params[:id])
    album = Album.find_by(id: params[:id])
    album_song = album.songs
    render json: album_song, status: :ok
  end

  private

  def album_params
    params.permit(:name, :album_image_url, :description)

  end
end

