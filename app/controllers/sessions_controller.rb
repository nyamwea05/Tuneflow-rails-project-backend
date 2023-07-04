class SessionsController < ApplicationController
      skip_before_action :authorized, only: [:create]
      wrap_parameters :user, include: %i[username password]

      def create
        @user = User.find_by(username: login_params[:username])

        if @user&.authenticate(login_params[:password])
          session[:user_id] = @user.id

          render json: { user: UserSerializer.new(@user), status: 'ok' }, status: :accepted
        else
          render_error
        end
      end

      def destroy
        session.delete(:user_id)

        log_out_message
      end

      private 
      def login_params
        params.require(:user).permit(:username, :password)
      end


      def render_error
         render json: { errors: ["Invalid username or password"] }, status: :unauthorized
      end

      def log_out_message
        render json: { message: 'Logout successfull' }, status: :ok
      end

end
