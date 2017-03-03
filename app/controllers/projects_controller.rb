class ProjectsController < ApplicationController
  # before_action :require_login
  # before_action :require_current_user ,only:[:edit,:update, :destroy]
  def index
    @projects = Project.all
    @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)
  end

  def new
    @projects = Project.all
    @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)
  end

  def create
    ninja = Ninja.find(session[:user_id])
    project = ninja.projects.new(name: params[:name], stack: params[:stack], description: params[:description], progress: params[:progress])
    if project.save
      redirect_to "/projects/#{project.id}"
    else
      flash[:errors] = project.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @project = Project.find(params[:id])
    @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)
  end

  def update
    project = Project.find(params[:id])
    if project.update(name: params[:name], description: params[:description], stack: params[:stack], progress: params[:progress])
       flash[:success] = "Project Updated!"
       redirect_to "/projects/#{project.id}"
     else
       flash[:errors] = project.errors.full_messages
       redirect_to :back
     end
  end

  def show
    @comments = Comment.all
    @project = Project.find(params[:id])
    @creator = @project.ninja_id
    @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to '/projects'
  end
end
