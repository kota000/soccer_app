class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new comment_params
    @comment.user_id = current_user.id
    @comments = @post.comments.paginate(page: params[:page], per_page: COMMENT_PAGINATION_COUNT).includes(user: :comments)
    if @comment.save
      # redirect_back(fallback_location: root_path)
      flash[:notice] = 'コメントを投稿しました。'
    else
      # redirect_back(fallback_location: root_path)
      flash[:notice] = 'コメントを作成できませんでした。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
