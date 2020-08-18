class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:info] = "Micropost created!"
      redirect_to request.referrer
    else
      # @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end
end