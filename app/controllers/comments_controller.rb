class CommentsController < ApplicationController
  def index
    comments = Comment.all
    render json: comments, status: :ok
  end

  def create
    if authorized
      comment = Comment.create(comment_params)
    else
      render json: {error: "sign in to continue"}, status: :unauthorized
    end

  end

  def update
    comment = Comment.find_by(id: params[:id])
    if authorized
      if comment
        comment = Comment.update(comment_params)
      else
        render json: comment, status: :ok
      end
    else
      render json: {error: "sign in to continue"}, status: :unauthorized
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if authorized
      if comment
        comment.destroy
        render json: status: :no_content
      else
        render json: {error: "comment not found"}, status: :not_found
      end
    else
      render json: {error: "sign in to continue"}, status: :unauthorized
    end

  end

  private

  def comment_params
    params.permit(:comment, :song_id)
  end

  # def validation_error
  #    error: "sign in to continue" status: :unauthorized
  # end

end
