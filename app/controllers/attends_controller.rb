class AttendsController < ApplicationController
	def create
		attend = Attend.new(user_id: session[:user_id], event_id: params[:event_id])
		attend.save
		redirect_to "/events/#{params[:event_id]}"
	end

	def destroy
		attend = Attend.find(params[:id]).destroy
		redirect_to :back
	end
end
