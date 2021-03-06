class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to root_path, :notice => "You are logged in."
  	else
  		flash.now[:alert] = "Your email and password are not correct."
  		render :new
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, :notice => "Logged out."
  end
end
