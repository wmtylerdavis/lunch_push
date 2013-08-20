class SessionsController < ApplicationController

	def new
		render 'new'
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    	if @user.save
      		flash[:success] = "Welcome to Team Lunch!"
      		sign_in @user
      		redirect_to root_url
    	else
    		flash.now[:error] = 'Invalid name'
      		render 'new'
    	end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

	private

	def user_params
		params.require(:session).permit(:name)
	end
end
