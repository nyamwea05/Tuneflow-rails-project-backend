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
  private

  def artist_params
    params.permit(:name)
  end
end


# remember to change ruby version
