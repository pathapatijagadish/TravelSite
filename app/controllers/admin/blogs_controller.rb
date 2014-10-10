class Admin::BlogsController < ApplicationController
    before_filter :current_admin
  	before_action :set_admin_blog, only: [:show, :edit, :update, :destroy]
    layout "admin"
  	def index
    	@blogs = Blog.all
  	end

  	def show
  	end

	def new
		@blog = Blog.new
	end

	def edit
	end

	def create
	    @blog = Blog.new(blog_params)
    	if @blog.save
      		flash[:notice] = "Blog created successfully"
     		redirect_to admin_blogs_path
    	else
        	flash[:error] = "Blog was not created"
        	render "new"
		end
	end

  	def update
      	if @blog.update(blog_params)
      		flash[:notice] = "Blog was updated successfully"
      		redirect_to admin_blogs_url
      	else
      		flash[:error] = "Blog was not Updated"
      		render "edit"
      	end
    end


  	def destroy
    	@blog.destroy
    	respond_to do |format|
      		format.html { redirect_to admin_blogs_url, notice: 'Blog was successfully destroyed.' }
      		format.json { head :no_content }
    	end
  	end

  	private

    def set_admin_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:name, :description, images_attributes: [:id,:avatar,:imageable_id,:imageable_type,:_destroy])
    end
end


