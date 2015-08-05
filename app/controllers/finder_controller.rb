class FinderController < ApplicationController
	before_action(:authenticate_user!)

	def search
		@users = current_user.nearbys(10)
		@client = GooglePlaces::Client.new("AIzaSyAdvCANrc5AQfhtGpsYbOCW2LKX9lR_VZw")
		@posts = Article.all.limit(10)
	end

	def show
		user = User.find_by(:id => params[:id]).to_json(include: :information, :methods => [:user_image_url, :count_followers])
		render(:json => user)
	end

	def follow
		user = User.find_by(:id => params[:id])
				
		if current_user == user
			flash[:error] = "You cannot follow yourself!"
		else
			current_user.follow(user)
			flash[:notice] = "Now following #{user.first_name}"
		end
		render(:json => user )
	end

	def unfollow
		@user = User.find(params[:id])
		current_user.stop_follow(@user)
		flash[:notice] = "You are not longer friends with #{user.first_name}"
	end
end
