class EventsController < ApplicationController

	def index
		@events_state = Event.where(state: current_user.state)
		@events_nostate = Event.where.not(state: current_user.state)
	end

	def create
		event = Event.new(event_params)
		if event.save
			Attend.create(user_id: event_params[:user_id], event_id: event.id)
			redirect_to :back
		else
			flash[:event_errors] = event.errors.full_messages
			redirect_to :back
		end
	end

	def show
		@event = Event.find(params[:id])
		@event_users = Attend.where(event_id: params[:id])
		@comments = Comment.where(event_id: params[:id])
		render 'show'
	end

	def destroy
		event = Event.find(params[:id]).destroy
		redirect_to :back
	end

	def edit
		@event = Event.find(params[:id])
		render 'edit'
	end

	def update
		event = Event.find(params[:id])
		event.update(event_params)

		redirect_to "/events"
	end

	private
	def event_params
		params.require(:events).permit(:name, :date, :location, :state, :user_id)
	end
end
