module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate!

    if respond_to?(:helper_method)
      helper_method :current_user, :signed_in?
    end
  end

  def sign_in!(user)
    session[:user_id] = user.id
  end

  def sign_out!
    reset_session
    @current_user = nil
  end

  private

  def authenticate!
    # TODO 認証処理（omniauth 差し替え？）
    raise unless signed_in?
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end