class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to request.referrer, notice: 'Micropost created!'
    else
      render 'static_pages/home'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: '投稿を削除しました。'
  end

  def index
    @posts = Post.paginate(page: params[:page], per_page: 12).search(params[:search])
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :teamname)
  end
end
