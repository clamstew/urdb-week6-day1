class CommentsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new(comment_params)

    if @comment.save
      redirect_to @comment.movie, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.movie, alert: 'Comment was not successfully created'
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params[:comment].permit(:comment, :movie_id)
  end

end
