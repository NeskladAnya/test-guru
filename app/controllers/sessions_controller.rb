class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(cookies[:intended_url] || tests_path)
      destination_path
    else
      flash.now[:alert] = 'Please check your email and password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Logged out"
    redirect_to login_path 
  end

  private

  def destination_path
    cookies.delete(:intended_url) || tests_path
  end
end
