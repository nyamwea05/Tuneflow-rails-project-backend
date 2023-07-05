class PlaylistsController < ApplicationController
  wrap_parameters format: []

  def index
    playlists = Playlist.all
    render json: playlists, status: :ok
  end

  def create
    playlist = Playlist.new(playlist_params)
    if playlist.save
      render json: playlist, status: :created
    else
      render json: { error: "Unable to create playlist" }, status: :unprocessable_entity
    end
  end

  def show
    playlist = Playlist.find_by(id: params[:id])
    if playlist
      render json: playlist.songs, status: :ok
    else
      render json: { error: "Playlist not found" }, status: :not_found
    end
  end

  def update
    playlist = Playlist.find_by(id: params[:id])
    if playlist
      playlist.assign_attributes(playlist_params)
      if playlist.save
        render json: playlist, status: :ok
      else
        render json: { error: "Unable to update playlist" }, status: :unprocessable_entity
      end
    else
      render json: { error: "Playlist not found" }, status: :not_found
    end
  end

  def destroy
    playlist = Playlist.find_by(id: params[:id])
    if playlist
      playlist.destroy
      render json: { message: "Deletion successful" }, status: :no_content
    else
      render json: { error: "Playlist not found" }, status: :not_found
    end
  end

  private

  def playlist_params
    params.permit(:playlist_name, :description)
  end
end
