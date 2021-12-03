class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Please check your email and password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path 
  end
end