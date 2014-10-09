class Admin::PackagesController < ApplicationController
	before_action :set_admin_package, only: [:show, :edit, :update, :destroy]
  layout "admin"
  	def index
    	@packages = Package.all
  	end

  	def show
  	end

  	def new
    	@package = Package.new
  	end


  	def edit
  	end

  
  	def create
    	@package = Package.new(package_params)
		if @package.save
        	flash[:notice] = "Package was successfully created"
        	redirect_to admin_packages_url
      	else
      		flash[:error] = "Package was not created"
      		render "new"
      	end
    end

  	def update
        if @package.update(package_params)
    	    flash[:notice] = "Package was updated successfully"
    	    redirect_to admin_packages_url
      	else
        	flash[:error] = "package was not updated"
        	render "edit"
      	end
    end

  	def destroy
    	@package.destroy
    	respond_to do |format|
      		format.html { redirect_to admin_packages_url, notice: 'Package was successfully destroyed.' }
      		format.json { head :no_content }
    	end
  	end

  private

    def set_admin_package
      @package = Package.find(params[:id])
    end

    def package_params
      params.require(:package).permit(:name, :description, :destination)
    end
end

