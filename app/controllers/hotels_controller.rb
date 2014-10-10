class HotelsController < ApplicationController
  	def index
  		@Hotels = Hotel.all
  	end

  	def show
  		@hotel = Hotel.find(params[:id])
  	end
end
