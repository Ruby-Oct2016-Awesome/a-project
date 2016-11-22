class TeamsController < ApplicationController

	def index
	end

	def new
		@team = current_user.teams.new
	end


	def create
		@team = current_user.teams.new(team_params)
		@team_user = @team.team_users
		if @team.save
			flash[:success] = 'Your team was successfully created'
			redirect_to team_team_user_path(@team, @team_user)
		else 
			render 'new'
			flash.now[:error] = 'Uh-oh, something went wrong. Try again'
		end
	end

	def destroy
		@team.destroy
	end

	private
	def team_params
		params.require(:team).permit(:name, :user_id)
	end
end


