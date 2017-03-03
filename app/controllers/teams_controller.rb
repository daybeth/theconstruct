class TeamsController < ApplicationController
	def create
		message = Message.find(params[:id])
		ninja = message.ninja
		project = Project.find(params[:project_id])
		existing = Team.where(:ninja => ninja, :project => project)
		if !existing
			team = Team.create(:ninja => ninja, :project => project)
			redirect_to "/projects/#{project.id}"
		else
			redirect_to :back
		end
	end
end