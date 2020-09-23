class PostsController < ApplicationController
  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to request.referrer, notice: '投稿を作成しました!'
    else
      redirect_to request.referrer, notice: '投稿することができませんでした。'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.paginate(page: params[:page], per_page: COMMENT_PAGINATION_COUNT).includes(user: :comments)
    @comment = @post.comments.build
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: '投稿を削除しました。'
  end

  def index
    @posts = Post.paginate(page: params[:page], per_page: POSTS_PAGINATION_COUNT).search(params[:search]).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :teamname)
  end
end
