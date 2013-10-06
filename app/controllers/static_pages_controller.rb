class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@lunch = current_user.lunches.build
  	end
  end

  def about
  end
end
