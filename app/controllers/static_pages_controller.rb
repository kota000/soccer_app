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
    @post = current_user.posts.build if user_signed_in?
    @current_page_posts = Post.where(teamname: action_name).order(created_at: :desc)
  end
end
