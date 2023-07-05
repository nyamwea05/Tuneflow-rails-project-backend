class CommentsController < ApplicationController
  wrap_parameters format: []

  def index
    comments = Comment.all
    render json: comments, status: :ok
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :ok
    else
      render json: { error: "Unable to create comment" }, status: :unprocessable_entity
    end
  end

  def update
    comment = Comment.find_by(id: params[:id])
    if authorized
      if comment
        if comment.update(comment_params)
          render json: comment, status: :ok
        else
          render json: { error: "Unable to update comment" }, status: :unprocessable_entity
        end
      else
        render json: { error: "Comment not found" }, status: :not_found
      end
    else
      render json: { error: "Sign in to continue" }, status: :unauthorized
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if authorized
      if comment
        comment.destroy
        render json: { message: "Deletion successful" }, status: :no_content
      else
        render json: { error: "Comment not found" }, status: :not_found
      end
    else
      render json: { error: "Sign in to continue" }, status: :unauthorized
    end
  end

  private

  def comment_params
    params.permit(:comment, :song_id)
  end
end
