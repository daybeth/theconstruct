class ProjectsController < ApplicationController
  before_action :require_login
  before_action :require_current_user ,only:[:edit,:update, :destroy]


#Displays all and projects according to stack
  def index
    if params[:stack] == 'all'
      @projects = Project.all.paginate(page:params[:page], per_page: 8)
    else
      @projects = Project.where(stack: params[:stack]).paginate(page:params[:page], per_page: 8)
    end
    @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)
  end


# Displays all of a single ninjas projects
def ninja
  ninja = Ninja.find(params[:id])
  @projects = Project.where(ninja_id:ninja.id)
  @ninja = Ninja.find(session[:user_id])
  @own_projects = Project.where(ninja_id:@ninja)
  @team_projects = Team.where(ninja_id:@ninja)
end




#View to form for creating a new project
  def new
    @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)
  end

#Method to create a new project in the database
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

#View to edit project details
  def edit
    @project = Project.find(params[:id])
    @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)
  end

#Method to update project details
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


#View to a single project
  def show
    @comments = Comment.all
    @project = Project.find(params[:id])
    @creator = @project.ninja_id
    @ninja = Ninja.find(session[:user_id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)
    @team = Team.where(project:@project)
  end

#Method to delete a project form the database
  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to '/projects/stack/all'
  end

  def paginate

  end


end
