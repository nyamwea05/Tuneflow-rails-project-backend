class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  skip_before_action :authorized, only: [:create, :update, :update_password]
  wrap_parameters :user, include: %i[first_name last_name phone email username bio avatar password password_confirmation]
  wrap_parameters format:[]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      render json: { user: UserSerializer.new(@user) }, status: :created, location: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(update_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end



  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def update_password
    @user = User.find_by(username: params[:username])

    if @user && @user.update(updateuser_params)
      render json:@user
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end


  private

  # Make use of private methods to avoid DRY
  def set_user
    @user = User.find(params[:id])
  end

  # Include only the parameters you require
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :username, :bio, :avatar, :password,:password_confirmation)
  end
  def update_params
    params.permit(:first_name, :last_name, :phone, :email, :username, :bio)

  end
  def updateuser_params
    params.permit(:username, :password,:password_confirmation)

  end
end
