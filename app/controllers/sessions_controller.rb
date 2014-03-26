class SessionsController < ApplicationController
  def new
  end

  def create
  	if user = User.authenticate(params[:session][:email], params[:session][:password])
  		session[:user_id] = user.id
      flash.notice = "Signed in successflly"
  		redirect_to root_path
  	else
  		flash.now.alert = "Wrong email or password."
  		redirect_to root_path
  	end
  end

  def destroy
  	reset_session
    flash.notice = "Signed out successfully!"
    redirect_to root_path
  end
end
