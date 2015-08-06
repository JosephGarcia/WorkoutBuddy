class ForumsController < ApplicationController
	def index
		@posts = Article.all.limit(10)
	end

	def show
		@article = Article.find_by(:id => params[:id])
		@comments = @article.comment_threads.order('created_at desc')
        @new_comment = Comment.build_from(@article, current_user.id, "")
	end

	def new 
		@comment = Comment.new
	end

end
