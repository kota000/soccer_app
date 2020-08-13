# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

  # ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password, :image]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end

