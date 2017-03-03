class SessionsController < ApplicationController
  def index
  end
  def create
  	ninja = Ninja.find_by(email: params[:email])

  	if ninja && ninja.authenticate(params[:password])
  		session[:user_id] = ninja.id
  		redirect_to "/projects/stack/all"
  	else
  		flash[:errors] = ["Invalid combination"]
  		redirect_to :back
  	end
  end

  def destroy
  	reset_session
  	redirect_to :root

  end
end
