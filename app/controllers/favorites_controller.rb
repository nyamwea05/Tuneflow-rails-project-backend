class FavoritesController < ApplicationController
  def index
    favorites = Favorite.all
  end

  def show
    favorite = Favorite.find_by(id: params[:id])
    render json: favorite, status: :ok
  end

  def create
    favorite = Favorite.save(favorite_params)
    if authorized
      if favorite
        render json: favorite, status: :ok
      else
        render json: {error: "unable to create"}, status: :unprocessable_entity
      end
    else
      render json: {error: "sign in to continue"}, status: :unauthorized
    end
  end

  def destroy
    if authorized
      favorite = Favorite.destroy
      render json: {message: "Deletion successful"}, status: :no_content
    else
      render json: {error: "Sign in to continue"}, status: :unauthorized
    end
  end

  private

  def favorite_params
    params.permit(:song, :user)
  end
end
