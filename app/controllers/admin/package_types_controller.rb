class Admin::PackageTypesController < ApplicationController
  before_filter :current_admin
	before_action :set_admin_package_type, only: [:show, :edit, :update, :destroy]
  layout "admin"
  def index
    @package_types = PackageType.all
  end

  def show
  end

  def new
    @package_type = PackageType.new
  end

  def edit
  end

  	def create
    	@package_type = PackageType.new(package_type_params)

   		if @package_type.save
	        flash[:notice] = 'Package type was successfully created.' 
    	    redirect_to admin_package_types_url
      	else
        	flash[:error] = 'package type was not created'
        	render "new"
      	end
    end

  	def update
        if @package_type.update(package_type_params)
        	flash[:notice] = 'Package type was successfully updated.' 
        	redirect_to admin_package_types_url
      	else
        	flash[:error] = "Package Type not updated"
        	render "edit"
      end
    end


  	def destroy
    	@package_type.destroy
    	respond_to do |format|
      		format.html { redirect_to admin_package_types_url, notice: 'Package type was successfully destroyed.' }
      		format.json { head :no_content }
    	end	
  	end

  	private

    def set_admin_package_type
      @package_type = PackageType.find(params[:id])
    end


    def package_type_params
      params.require(:package_type).permit(:transport, :price, :days, :nights, :package_id,images_attributes: [:id,:avatar,:imageable_id,:imageable_type,:_destroy])
    end
end
