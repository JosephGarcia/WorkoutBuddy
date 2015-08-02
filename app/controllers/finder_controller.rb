class FinderController < ApplicationController
	before_action(:authenticate_user!)

	def search
		@users = current_user.nearbys(10)
	end

	def show
		user = User.find_by(:id => params[:id]).to_json(include: :information, :methods => :user_image_url)
		render(:json => user)
	end

end
