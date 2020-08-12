# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

  # ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end

