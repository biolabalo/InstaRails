class UsersController < ApplicationController

    def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
  flash[:success] = "Welcome to InstaRails #{@user.username}"
    redirect_to '/'
    else
    render 'sessions/new' # i am still making use of a view of another controller(sessions)
    end  
    end



  def show
    @user = User.find(params[:id])
    @posts = Post.where(:user_id => @user.id) # OR   @post = current_user.posts 
      #  @posts = current_user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(current_user.id)
  end
 
  def update
    current_user.update(user_params)
    redirect_to current_user # http://localhost:3000/users/1
  end

  private
  def user_params
  params.require(:user).permit(:username, :email, :password)

  # User(id: integer, username: string, email: string, name: string, website: string, bio: text, phone: integer, gender: string, password_digest: string, created_at: datetime, updated_at: datetime) 

  end

end


