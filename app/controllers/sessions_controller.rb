class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login(user)
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password."
      redirect_to login_url
    end
  end

  def destroy
    log_out 
    flash[:success] = "You have been logged out."
    redirect_to root_path
  end
end
