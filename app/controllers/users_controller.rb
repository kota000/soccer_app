class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'Userを削除しました。'
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
