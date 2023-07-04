class PlaylistsController < ApplicationController
  wrap_parameters format: []

  def index
    playlists = Playlist.all
    render json: playlists
  end

  def create
    playlist = Playlist.create(playlist_params)
    if authorized
      if playlist
        render json: playlist
      else
        render json: {error: "unable to create"}, status: :unprocessable_entity
      end
    else
      render json: {error: "sign it to continue"}, status: :unauthorized
    end
  end

  def show
    playlist = Playlist.find_by(id: params[:id])
    if playlist
      render json: playlist.song
    else
      render json: {error: "playlist not found"}, status: :not_found
    end
  end

  def update
    
  end

  private

  def playlist_params
    params.permit(:playlist_name, :descriptions)
  end
end
