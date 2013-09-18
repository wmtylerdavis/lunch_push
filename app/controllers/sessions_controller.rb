class SessionsController < ApplicationController

	def new
		render 'new'
		@user = User.new
	end

	def create
		user = User.find_by(email: params[:email].downcase)
    	if user && user.authenticate(params[:password])
      		sign_in user
      		redirect_to root_url
    	else
      		flash.now[:error] = 'Invalid email/password combination' # Not quite right!
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
