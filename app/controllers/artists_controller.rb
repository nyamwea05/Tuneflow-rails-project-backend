class ArtistsController < ApplicationController
  def index
    artists = Artist.all
    render json: artists, status: :ok
  end

  def show
    artist = Artist.find_by(id: params[:id])
    render json: artist, status: :ok
  end
  private

  def artist_params
    params.permit(:name)
  end
end


# remmember to change ruby version
