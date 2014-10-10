class Admin::UsersController < ApplicationController
 	before_filter :current_admin
	before_action :set_admin_package, only: [:show, :edit, :update, :destroy]
  	layout "admin"
  	
  	def index
    	@users = User.all
  	end

  	def destroy
  		@user = User.find(params[:id])
    	@user.destroy
    	respond_to do |format|
      		format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      		format.json { head :no_content }
    	end
  	end
end