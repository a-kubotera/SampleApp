class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :confirm, :update]
  before_action :vaidate_existance, only: [:new, :create]  
  before_action :vaidate_existance2, only: [:edit]  

  def new
    @profile = current_user.build_profile
    @profile.game_careers.build
    @profile.possess_games.build
  end

  def edit
  end

  def confirm
    if @profile
      @profile.assign_attributes(profile_params)
      render :edit if @profile.invalid?
    else
      @profile = current_user.build_profile(profile_params)
      render :new if @profile.invalid?
    end
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if !submit_back? && @profile.valid?
      @profile.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @profile.assign_attributes(profile_params)
    if !submit_back? && @profile.valid?
      @profile.save!
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(current_user.profile.id) if current_user.profile.present?
  end

  def vaidate_existance
    redirect_to edit_profile_path if current_user.profile
  end
  def vaidate_existance2
    redirect_to new_profile_path if current_user.profile.blank?
  end

  def submit_back?
    params[:commit] == I18n.t('helpers.submit.back')
  end

  def profile_params
    params.require(:profile).permit(
      :email, :tell, :prefecture_id, :city,
      game_careers_attributes: [:id, :profile_id, :name, :_destroy],
      possess_games_attributes: [:id, :profile_id, :game_console_id, :_destroy]
    )
  end
end
