# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @post = current_user.posts.build if user_signed_in?
  end

  def kawasaki
    @posts=Post.all
    @post = current_user.posts.build if user_signed_in?
    if user_signed_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed#.paginate(page: params[:page])
    end
  end
end
