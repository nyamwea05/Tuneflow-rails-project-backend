class SongsController < ApplicationController
    wrap_parameters format: []

    def index
      songs = Song.all
      render json: songs
    end

    def show
      song = Song.find_by(id: params[:id])
      if song
        render json: song
      else
        render_error("Song not found")
      end
    end

    def create
      song = Song.new(song_params)
      if song.save
        render json: song
      else
        render_validation_errors(song.errors.full_messages)
      end
    end

    def update
        song = Song.find_by(id: params[:id])
        if song
          if song.update(song_params)
            render json: song, status: :ok
          else
            render_validation_errors(song.errors.full_messages)
          end
        else
          render_error("Song not found")
        end
    end

    def destroy
      song = Song.find_by(id: params[:id])
      if song
        song.playlist.destroy
        song.favorites.destroy
        song.comments.destroy
        song.destroy
        head :no_content
      else
        render_error("Song not found")
      end
    end
 



    private

    def song_params
      params.permit(:title, :genre, :description, :image_path, :artist_id, :album_id, :playlist_id)
    end

    def render_error(message)
      render json: { error: message }, status: :not_found
    end

    def render_validation_errors(errors)
      render json: { errors: errors }, status: :unprocessable_entity
    end

    def render_authorization_errors(message)
      render json: { errors: [message] }, status: :unauthorized
    end
  end
