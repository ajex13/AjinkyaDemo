class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end
  def create
    @comment = Comment.new(comment_params)
    #@comment.user_id = current_user.id
    @post  = Post.find(params[:post_id])
    if @comment.save
      redirect_to :back, notice: "Thank you for adding a comment"

    else
      render action: 'new'
    end
  end

  private

    def comment_params
      params[:comment].permit(:body,:post_id)
    end

end
