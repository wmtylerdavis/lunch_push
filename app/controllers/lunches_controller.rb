class LunchesController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

  def show
  	@lunch = Lunch.find(params[:id])
    if @lunch.restaurants.any?
      @restaurants = @lunch.restaurants[0..@lunch.restaurants.count]
    end
    @restaurant = @lunch.restaurants.build
  end

  def create
    @lunch = current_user.lunches.build()
    if @lunch.save
      	flash[:success] = "Lunch created!"
      	redirect_to @lunch
    else
      	render 'static_pages/home'
    end
  end

  def edit
  end

  def destroy
    Lunch.find(params[:id]).destroy
    flash[:success] = "Lunch destroyed."
    redirect_to root_url
  end

  private

 	def correct_user
		@lunch = current_user.lunches.find_by(id: params[:id])
		redirect_to root_url if @lunch.nil?
	end
end
