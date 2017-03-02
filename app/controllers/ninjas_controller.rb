class NinjasController < ApplicationController
  #  before_action :require_login, except:[:new,:create]
  #  before_action :require_current_user, except:[:new,:create]
  def new
  end
  def create
    ninja = Ninja.new(ninja_params)

   if ninja.save
      flash[:success] = "You have registered successfully. Please Log in"
      redirect_to "/projects"
    else
      flash[:errors] = ninja.errors.full_messages
      redirect_to :back
    end
  end

  def update
    ninja = Ninja.find(session[:user_id])
    if ninja.update(ninja_params)
       flash[:success] = "Ninja Updated!"
       redirect_to "/ninjas/#{ninja.id}"
     else
       flash[:errors] = ninja.errors.full_messages
       redirect_to :back
     end
  end

  def destroy
  end

  def edit
    @ninja = Ninja.find(params[:id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)

  end

  def show
    @ninja = Ninja.find(params[:id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)

  end
  private
  def ninja_params
    params.require(:ninja).permit(:first_name, :last_name, :location, :ninja_name, :email, :password, :password_confirmation)
  end
end
