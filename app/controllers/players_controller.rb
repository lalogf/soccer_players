class PlayersController < ApplicationController
	
	before_filter :assign_team, only:[:new, :edit] 
	before_filter :assign_player, only:[:edit, :update, :show, :destroy]

	def index
		
	end
	def create
		# team = Team.find(params[:team_id])

		# player = Player.create(player_params)

		# team.players << player

		Player.create(player_params.merge(team_id: params[:team_id]))

		redirect_to '/'

		
	end
	def new
		# @team = Team.find(params[:team_id])
		@player = Player.new
		
	end
	def edit
		# @team = Team.find(params[:team_id])
		# @player = Player.find(params[:id])
		
	end
	def show

		@player 
		
	end
	def update

		# player = Player.find(params[:id])
		@player.update(player_params)

		redirect_to '/'


		
	end
	def destroy

		@player.destroy

		redirect_to '/'

	end

	private
	def player_params
		params.require(:player).permit(:name, :jersey)
	end

	def assign_player

		@player = Player.find(params[:id])

		
	end

	def assign_team

		@team = Team.find(params[:team_id])

		
	end


end
