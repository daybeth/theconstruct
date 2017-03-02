class MessagesController < ApplicationController

  def create
    ninja = Ninja.find(session[:user_id])
    creator = Ninja.find(params[:id])

    Message.create(ninja_id:ninja.id, receiver_id:creator.id, content:params[:content])
    redirect_to '/projects'
  end

  def new
    @creator = Ninja.find(params[:id])
  end

  def edit
  end

  def update
  end

  def show
    ninja = Ninja.find(session[:user_id])
    @messages = Message.where(receiver_id:ninja.id)

  end

  def destroy
  end

  # This is a comment
end
