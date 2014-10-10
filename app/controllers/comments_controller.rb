class CommentsController < ApplicationController
	before_action :authenticate_user!
  	before_action :set_comment, only: [:destroy]
  	#before_action :find_forum_and_topic

  	def create

    	@comment = Comment.new(comment_params)
    	respond_to do |format|
	      	if @comment.save 
            @blog = @comment.blog       
	        	format.js {}        
	      	else        
	        	format.js{          
	          		flash[:error] = @comment.errors.full_messages.map{|x| "<span>#{x}</span>" }.join(' ')                  
	        	} 
	      	end      
    	end
  	end

	def destroy
	    @comment.destroy
	    respond_to do |format|      
	      format.js { 
	        flash[:notice] = 'Comment was successfully deleted.'
	      }
	    end
	end

  	private

    def set_comment
      	@comment = Comment.find(params[:id])
      	rescue ActiveRecord::RecordNotFound
        flash[:error] = "Record not found ..!!!"
        redirect_to root_url
    end

=begin
    def find_forum_and_topic
      	#@forum = Forum.find(params[:forum_id])
      	@topic = @forum.topics.find(params[:blog_id])
      	rescue ActiveRecord::RecordNotFound
        	flash[:error] = "Record not found ..!!!"
        	redirect_to root_url
    end
=end

    def comment_params
      params.require(:comment).permit(:description, :user_id, :blog_id)
    end
end

