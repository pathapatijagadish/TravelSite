class PackageTypesController < ApplicationController
  def index
  		@package_types = PackageType.all
  	end

  	def show
  		@package_type = PackageType.find(params[:id])
  	end
end
