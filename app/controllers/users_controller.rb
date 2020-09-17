class UsersController < ApplicationController
  before_action :if_not_admin

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

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

    if user.present?
      sns = SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        user_id: user.id
      )
    else
      user = User.new(
        username: auth.info.name,
        email: auth.info.email,
      )
      sns = SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end
    { user: user, sns: sns }
    end

  def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    if user.blank?
      user = User.new(
        username: auth.info.name,
        email: auth.info.email,
      )
    end
    { user: user }
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    { user: user, sns: sns }
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
