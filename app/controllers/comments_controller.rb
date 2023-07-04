class CommentsController < ApplicationController
  def index
    comments = Comment.all
    render json: comments
  end

  def create
    comment = Comment.create(comment_params)
  end

  def update
    comment = Comment.find_by(id: params[:id])
    if authorized
      if comment
        comment = Comment.update(comment_params)
      else
        render json: comment
      end
    else
      render json: validation_error
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if authorized
      if comment
        comment.destroy
        # render json:
      else
        render json: {error: "comment not found"} status: :not_found
      end
    else
      render json: validation_error
    end

  end

  private

  def comment_params
    params.permit(:comment)
  end

  def validation_error
     {error: "sign in to continue"} status: :unauthorized
  end

end
