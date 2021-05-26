class CommentsController < ApplicationController
    before_action :authenticate_member!

    def new
        @comment = current_member.comments.build
    end

    def create
        @comment = current_member.comments.build(comment_params)

        if @comment.save
            flash[:notice] = "Successfully added comment"
            redirect_to post_path(@comment.post)
        else
            flash.now[:alert] = "There was an error creating your comment"
            @post = @comment.post
            render '/posts/show'
        end
    end

    def edit
        begin
          @comment = current_member.comments.find(params[:id])
        rescue
          if Comment.exists?(params[:id])
            flash[:alert] = "You do not have permission to edit that comment"
          else
            flash[:alert] = "Comment doesn't exist"
          end
        end
    end

    def update
        begin
            @comment = current_member.comments.find(params[:id])
        rescue
            if Comment.exists?(params[:id])
                flash[:alert] = "You do not have permission to edit that comment"
            else
                flash[:alert] = "Comment doesn't exist"
            end
            redirect_to root_url
        else
            if @comment.update(comment_params)
                flash[:notice] = "Succesfully edited comment!"
                redirect_to post_path(@comment.post)
            else
                flash.now[:alert] = "There was an error editing your comment."
                render "edit"
            end
        end
    end

    def destroy
        begin
            @comment = current_member.comments.find(params[:id])
        rescue
            if Comment.exists?(params[:id])
                flash[:alert] = "You do not have permission to delete that comment"
            else
                flash[:alert] = "Comment doesn't exist"
            end
        else
            @comment.destroy
        end
        redirect_to post_path(@comment.post)
    end

    private
    def comment_params
      params.require(:comment).permit(:body).merge(post_id: params[:post_id])
    end
end
