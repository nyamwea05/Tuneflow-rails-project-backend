class FavoritesController < ApplicationController
  def index
    favorites = Favorite.all
    render json: favorites, status: :ok
  end

  def show
    favorite = Favorite.find_by(id: params[:id])
    if favorite
      render json: favorite, status: :ok
    else
      render json: { error: "Favorite not found" }, status: :not_found
    end
  end

  def create
    favorite = Favorite.new(favorite_params)

    if favorite.save
      render json: favorite, status: :created
    else
      render json: { error: "Unable to create favorite" }, status: :unprocessable_entity
    end
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    if favorite
      favorite.destroy
      render json: { message: "Deletion successful" }, status: :no_content
    else
      render json: { error: "Favorite not found" }, status: :not_found
    end

  end

  private

  def favorite_params
    params.permit(:song, :user)
  end
end
