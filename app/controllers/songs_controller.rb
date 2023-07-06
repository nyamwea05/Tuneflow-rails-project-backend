class SongsController < ApplicationController
    
    wrap_parameters format: []
    def index
        songs=Song.all
        render json: songs 
    end

    def show
        song=Song.find_by(id: params[:id])
        if song
            render json: song 
        else 
            render_error
        end
    end

    def create 
        if session[:user_id]
            song=Song.new(song_params)
            song.user_id=session[:user_id]
            if song.save
                render json:song
            else
                render_validation_errors
            end
        else
            render_authorization_errors
        end

    end 

    def update
        if session[:user_id]
            song=Song.find_by(id: params[:id])
            if song
                if song.update(song_params)
                    render json:song, status: :ok
                else 
                    render_validation_errors
                end
            else 
                render_error
            end
        else
            render_authorization_errors
        end
    end

    def destroy
        if session[:user_id]
            song=Song.find_by(id: params[:id])
            if song
                song.playlist.destroy_all
                song.favorites.destroy_all
                song.comments.destroy_all
                song.destroy
                head :no_content
            else
                render_error
            end

        else
            render_authorization_errors
        end


    end



    private
    def song_params
        params.permit(:title, :genre, :description, :image_path, :artist_id, :album_id, :playlist_id)

    end
    def render_error
        render json: {error: "Song not found"}, status: :not_found
    end

    def render_validation_errors
        render json: { errors: ["Validation errors"] }, status: :unprocessable_entity
    end
    def render_authorization_errors
        render json: { errors: ["Not authorized"] }, status: :unauthorized
    end
end
