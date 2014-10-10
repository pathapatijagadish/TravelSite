class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def current_admin
      authenticate_user!
      redirect_to root_url unless current_user
      unless current_user.is_admin?
        redirect_to root_url
      end
    end

  	def after_sign_in_path_for(resource)
  		if current_user.is_admin == true 
			  admin_hotels_path
		  else
			  root_path
		  end
  	end

  	def after_sign_up_path_for(resource) 
  		root_path
	end 
end
