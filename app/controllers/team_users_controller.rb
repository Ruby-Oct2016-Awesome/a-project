class TeamUsersController < ApplicationController
	before_action do
		@team = Team.find(params[:team_id])
	end
		
	def index
	end

	def new
	end

	def show
		@teams = Team.where(user_id: current_user.id)
		@team_user = @team.team_users.new	
	end

	def create
		@team_user = @team.team_users.new(team_user_params)
		if @team_user.save
			flash[:success] = 'You have successfully added a member'
			redirect_to team_team_user_path(id: @team_user.id)
		else
			flash.now[:error] = "Error: #{@team_user.errors.full_messages.to_sentence}" 
			render 'index'
		end
	end

	def destroy
	end

	private
	def team_user_params
		params.require(:team_user).permit(:user_id, :team_id)
	end

end
