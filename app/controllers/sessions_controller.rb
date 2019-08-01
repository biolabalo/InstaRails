class SessionsController < ApplicationController
  
  def new
    @posts = Post.all.order(created_at: :desc)
    @user = User.new
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    if user
     session[:user_id] = user.id
     flash[:success] = 'Successfully Logged In!'
     redirect_to '/'
    else
     flash[:warning] = 'Invalid Username or Password'
     redirect_to '/'
    end
   end
  
   def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully Logged Out!'
    redirect_to '/'
   end


  

end