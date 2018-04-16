class ProfilesController < ApplicationController
  before_action :vaidate_existance, only: [:new, :create]
  before_action :set_profile, only: [ :edit, :update]
  def new
    @profile = current_user.build_profile
    @profile.game_careers.build
    @profile.possess_games.build
  end

  def confirm
    binding.pry
    @profile = current_user.build_profile(profile_params)
  end

  def create
    binding.pry
    @profile = current_user.build_profile(profile_params)
    if @profile.valid?
      @profile.save!
      redirect_to root_path
    end
  end


  private

  def set_profile
    # NOTE: bullet警告対策
    # @profile = Profile.includes(profile_medical_courses: [medical_course: [:category]]).find(current_user.profile.id)
    @profile = Profile.find_by(current_user.profile.id)
  end

  def vaidate_existance
    redirect_to edit_profile_path if current_user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :email, :tell, :prefecture_id, :city,
      game_careers_attributes: [:id, :profile_id, :name, :_destroy],
      possess_games_attributes: [:id, :profile_id, :game_console_id, :_destroy]
    )
  end
end
