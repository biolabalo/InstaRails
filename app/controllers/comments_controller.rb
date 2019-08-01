class CommentsController < ApplicationController
  def create
     @post = Post.find(params["post_id"])
     @comment = @post.comments.new(params.require(:comment).permit(:body))
     @comment.user_id = session[:user_id] 
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Check the comment form, something went wrong."
      render root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end