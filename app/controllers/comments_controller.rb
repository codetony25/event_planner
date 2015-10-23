class CommentsController < ApplicationController

	def create
		comment = Comment.new(content: params[:comments], user_id: session[:user_id], event_id: params[:event_id])
		comment.save

		redirect_to :back
	end
end
