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
  end

  def update
  end

  def show
    @ninja = Ninja.find(session[:user_id])
    @project = Project.find(params[:id])
    @comments = Comment.all
    @creator = @project.ninja_id
  end

  def destroy
  end
end
