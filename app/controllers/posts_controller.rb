class PostsController < ApplicationController

  def new
  end

  def like
    like = Like.find_or_initialize_by(user_id: current_user.id, post_id: params[:id])
    like.persisted? ? like.destroy : like.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
  end
end

  def create
    
    @post = current_user.posts.build(params.require(:post).permit(:description, :image))
    if @post.save
      flash[:danger] = "Post was successfully created"  
      redirect_to user_path(current_user)
    else
    debugger
    end
  end

end