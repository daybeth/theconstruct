class NinjasController < ApplicationController
   # before_action :require_login, except:[:new,:create]
   # before_action :require_current_user, except:[:new,:create]
  def new
  end
  def create
    ninja = Ninja.new(ninja_params)

   if ninja.save 
      flash[:success] = "You have registered successfully. Please Log in"
      redirect_to :root
    else
      flash[:errors] = ninja.errors.full_messages
      redirect_to :back
    end
  end
  def update
  end

  def destroy
  end

  def edit
  end

  def show
    @ninja = Ninja.find(params[:id])
    @own_projects = Project.where(ninja_id:@ninja)
    @team_projects = Team.where(ninja_id:@ninja)

  end
  private
  def ninja_params
    params.require(:ninja).permit(:first_name, :last_name, :ninja_name, :email, :password, :password_confirmation)    
  end
end
