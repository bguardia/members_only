class PostsController < ApplicationController
    before_action :authenticate_member!, only: [:new, :create, :edit, :destroy]

    def index
      @posts = Post.all.order("created_at DESC")
    end

    def new
        @post = current_member.posts.build
    end

    def show
       @post = Post.find(params[:id])
    end

    def create
        @post = current_member.posts.build(post_params)

        if @post.save
            flash[:notice] = "Post successfully created!"
            redirect_to post_path(@post)
        else
            flash.now[:alert] = "Post creation failed!"
            render "new"
        end
    end

    def edit
        begin
            @post = current_member.posts.find(params[:id])
        rescue
            if Post.exists?(params[:id])
                flash[:alert] = "You do not have permission to edit that post"
            else
                flash[:alert] = "Post does not exist"
            end
            redirect_to root_url
        end
    end

    def update
       @post = current_member.posts.find(params[:id])
       
       if @post.update(post_params)
          flash[:notice] = "Post successfully updated!"
          redirect_to post_path(@post)
       else
          flash.now[:alert] = "Post update failed!"
          render "edit"
       end
    end

    def destroy
        begin
            @post = current_member.posts.find(params[:id])
        rescue
            if Post.find_by(id: params[:id])
                flash[:alert] = "You do not have permission to delete that post"
            else
                flash[:alert] = "Post does not exist"
            end
        else
            @post.destroy
            flash[:notice] = "Post successfuly deleted"
        end
      redirect_to root_url
    end

    private
    def post_params
      params.require(:post).permit(:id, :title, :body)
    end
end
