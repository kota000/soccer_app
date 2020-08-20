class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.now[:success] = "User deleted"
    redirect_to root_path
  end
end
