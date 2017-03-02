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
        @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)

  end

  def destroy
  end
end
