class ProjectsController < ApplicationController
  before_action :require_login
  before_action :require_current_user ,only:[:edit,:update, :destroy]
  def index
    @projects = Project.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @project = Project.find(params[:id])
    @comments = Comment.all
  end

  def destroy
  end
end
