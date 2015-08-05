class PostsController < ApplicationController
	def show
		@article = Article.find_by(:id => params[:id])
		@comments = @article.comment_threads
	end

	def new 
		
	end
end
