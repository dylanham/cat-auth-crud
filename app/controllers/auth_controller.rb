class AuthController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Thank you for signing in!"
      redirect_to root_path
    else
      flash[:notice] = "something went wrong"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "goodbye"
    redirect_to root_path
  end

end
