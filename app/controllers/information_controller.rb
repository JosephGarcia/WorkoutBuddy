class InformationController < ApplicationController
	before_action(:authenticate_user!)


	def show
		information = current_user.information
		render(:json => information)
	end
	
def new
	@information = Information.new
end

def create
	@information = Information.new(info_params)
	current_user.information = @information
	redirect_to("/home")
end


private

def info_params
		params.require(:information).permit(:height, :weight, :education, :strengths, :weaknesses, :goals, :memberships, :equipment, :activities, :photo)
	end
end
