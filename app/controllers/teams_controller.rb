class TeamsController < ApplicationController
	def index
		@teams = Team.all

		render 'index'
		
	end
	def create
		# Team.create(name: params[:team][:name], country: params[:team][:country])
		#will equal the above 
		Team.create(team_params)
		redirect_to '/'
	end
	def new
		@team = Team.new #assume you are creating a new Team, so the form generator can now the columns
		
	end
	def edit
		@team = Team.find(params[:id])
		
	end
	def show
		@team = Team.find(params[:id])


	end
	def update
		team = Team.find(params[:id])
		team.update(team_params)

		redirect_to '/'
		
	end
	def destroy
		@team = Team.find(params[:id])
		@team.destroy

		redirect_to '/'
		
	end
	
	#will make private this methods / so people can't edit or create things that they are not allowed - should also ad a validator
	private
	def team_params
		params.require(:team).permit(:name, :country)
	end
end
