class Debug::SessionsController < ApplicationController
  skip_before_action :authenticate!

  def new
  end

  def create
    sign_in!(user)

    redirect_to :root
  end

  def destroy
    sign_out!

    redirect_to debug_login_path
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end
end
