# frozen_string_literal: true

class StaticPagesController < ApplicationController
  before_action :create_post, except: [:home]
  def home
  end

  def kawasaki
  end

  def goosaka
  end

  def seresso
  end

  def nagoya
  end

  def kasiwa
  end

  def fctokyo
  end

  def urawa
  end

  def hirosima
  end

  def sapporo
  end

  def koube
  end

  def yokohamafm
  end

  def kasima
  end

  def senndai
  end

  def simizu
  end

  def saganntosu
  end

  def ooita
  end

  def shounann
  end

  def yokohamafc
  end

  def all
  end

  private

  def create_post
    @posts = Post.paginate(page: params[:page], per_page: 12)
    @post = current_user.posts.build if user_signed_in?
    if user_signed_in?
      @post = current_user.posts.build
    end
  end
end
