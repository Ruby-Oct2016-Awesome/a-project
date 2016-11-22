class TeamsController < ApplicationController

	def index
	end

	def new
		if current_user
			@team = current_user.teams.new
		else
			flash[:notice] = "You need an account to create teams"
			redirect_to root_path
		end
	end

	def my_team
		if current_user
			@teams = current_user.teams
		else
			flash[:notice] = "You need an account to access teams"
			redirect_to root_path
		end
	end

	def create
		@team = current_user.teams.new(team_params)
		# @team_user = @team.team_users

		if @team.save
			flash[:success] = 'Your team was successfully created'
			# team_team_user_path(@team, @team_user)
			redirect_to my_team_path
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


