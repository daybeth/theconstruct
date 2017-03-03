class CommentsController < ApplicationController
  before_action :require_login

  def create
    project = Project.find(params[:id])
    ninja = Ninja.find(session[:user_id])
    comment = Comment.create(content: params[:content], ninja:ninja,project:project)
    if comment.save
      redirect_to :back
    else
      flash[:errors] = comment.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
  end
end
