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
        render json: playlist, status: :created
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
    playlist = Playlist.find_by(id: params[:id])
    if authorized
      if playlist
        playlist = Playlist.update(playlist_params)
        render json: playlist
      else
        render json: {error: "playlist not found"}, status: :not_found
      end
    else
      render json: {error: "sign in to continue"}, status: :unauthorized
    end
  end

  def destroy
    playlist = Playlist.find_by(id: params[:id])
    if authorized
      if playlist
        playlist.destroy
        render json: status: :no_content
      else
        render json: {error: "playlist not found"}, status: :not_found
      end
    else
      render json: {error: "sign in to continue"}, status: :unauthorized
    end
  end

  private

  def playlist_params
    params.permit(:playlist_name, :descriptions)
  end
end
