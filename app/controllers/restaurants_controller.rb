class RestaurantsController < ApplicationController
  before_filter :get_lunch

	def create
  		@restaurant = @lunch.restaurants.build(restaurant_params)
    	if @restaurant.save
        flash[:success] = "Restaurant created!"
        redirect_to @lunch
      else
        @restaurants = []
        render 'static_pages/home'
    	end
  	end

  	def destroy
  		@restaurant.destroy
  	end

  private

	def restaurant_params
		params.require(:restaurant).permit(:name, :website)
	end

  def get_lunch
    @lunch = Lunch.find(params[:lunch_id])
  end
end
