class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:info] = "Micropost created!"
      redirect_to request.referrer
    else
      render 'static_pages/home'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash.now[:success] = "投稿を削除しました。"
    redirect_to root_path
  end

  def search
    @posts = Post.all
    #Viewのformで取得したパラメータをモデルに渡す
    # @posts = Post.search(params[:search])
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :teamname)
  end
end
