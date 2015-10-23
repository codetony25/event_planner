class UsersController < ApplicationController

	def index

	end

	def create
		user = User.new(user_params)

		if user.save
			session[:user_id] = user.id
			redirect_to "/events"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to :back
		end
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

	def update
		user = User.find(params[:id])
		if user.update(user_params) 
			redirect_to "/events"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to :back
		end
	end

	private
	def user_params
		params.require(:users).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
	end
end
