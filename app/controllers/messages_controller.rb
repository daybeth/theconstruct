class MessagesController < ApplicationController

  def create
    ninja = Ninja.find(session[:user_id])
    creator = Ninja.find(params[:id])
    Message.create(ninja_id:ninja.id, receiver_id:creator.id, content:params[:content])
    redirect_to '/projects/stack/all'
  end

  def new
    @creator = Ninja.find(params[:id])
    @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)
    @project = Project.find(params[:project_id])
  end

  def show
    ninja = Ninja.find(session[:user_id])
    @messages = Message.where(receiver_id:ninja.id)
    @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)
    @project = Project.find(params[:id])
    @team = Team.find_by(ninja_id: ninja, project_id: @project)
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to :back
  end
end
