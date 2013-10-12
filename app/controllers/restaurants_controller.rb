class RestaurantsController < ApplicationController
  before_filter :get_lunch
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

	def create
  		@restaurant = @lunch.restaurants.build(restaurant_params)
      @restaurant.user = current_user
    	if @restaurant.save
        flash[:success] = "Restaurant created!"
        redirect_to @lunch
      else
        @feed_items = []
        render 'static_pages/home'
    	end
  	end

  	def destroy
  		@restaurant.destroy
      redirect_to @lunch
  	end

  private

	def restaurant_params
		params.require(:restaurant).permit(:name, :website, :user_id)
	end

  def get_lunch
    @lunch = Lunch.find(params[:lunch_id])
  end

  def correct_user
    @restaurant = current_user.restaurants.find_by(id: params[:id])
  end
end
