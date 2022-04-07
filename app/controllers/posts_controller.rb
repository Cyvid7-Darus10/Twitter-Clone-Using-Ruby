class PostsController < ApplicationController
    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            flash[:success] = "Your post has been created!"
            redirect_to user_path(current_user)
        else
            @user = current_user
            render "users/show"
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:success] = "Your post has been deleted."
        redirect_to user_path(current_user)
    end

    private
    def post_params
        params.require(:post).permit(:content)
    end
end
