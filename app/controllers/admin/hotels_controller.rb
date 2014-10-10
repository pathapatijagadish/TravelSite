class Admin::HotelsController < ApplicationController
  before_filter :current_admin
	before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  layout "admin"

 	def index
   	@hotels = Hotel.all
 	end

	def show
	end

	def new
    	@hotel = Hotel.new
  	end

  	def edit
  	end


  	def create
    	@hotel = Hotel.new(hotel_params)
      	if @hotel.save
			#render :text=>params and return false
	        redirect_to admin_hotels_url
     	else
	        render "new"
      	end
  	end


  	def update
	    if @hotel.update(hotel_params)
	        redirect_to admin_hotels_url
	    else
	        render "edit"
	    end
  	end

	def destroy
	    @hotel.destroy
	    respond_to do |format|
	      	format.html { redirect_to admin_hotels_url, notice: 'Hotel was successfully destroyed.' }
	      	format.json { head :no_content }
	    end
	end

  private

    def set_hotel
      	@hotel = Hotel.find(params[:id])
    end


    def hotel_params
      	params.require(:hotel).permit(:name, :address, images_attributes: [:id,:avatar,:imageable_id,:imageable_type,:_destroy])
    end
end

