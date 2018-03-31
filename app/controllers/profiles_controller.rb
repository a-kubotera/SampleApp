class ProfilesController < ApplicationController
  # before_action :vaidate_existance, only: [:new, :create]
  before_action :set_profile, only: [:confirm, :edit, :update]

  def new
    binding.pry
    @user = current_user
    # @profile = current_user.build_profile
    # @profile.profile_medical_courses.build
    # @profile.careers.build
    # @profile.affiliations.build
  end

  # def edit
  # end

  # def confirm
  #   if @profile
  #     @profile.assign_attributes(profile_params)
  #     @icon = ProfileIconAttachment.new(file: icon_params) if icon_params.present?
  #     render :edit if @profile.invalid?
  #   else
  #     @profile = current_user.build_profile(profile_params)
  #     @icon = ProfileIconAttachment.new(file: icon_params) if icon_params.present?
  #     render :new if @profile.invalid?
  #   end
  # end

  # def create
  #   fail ActiveRecord::RecordInvalid if current_user.profile
  #   @profile = current_user.build_profile(profile_params)

  #   if submit_create? && @profile.valid?
  #     Profile.transaction do
  #       @profile.build_icon.file.retrieve_from_cache!(icon_params) if icon_params.present?
  #       @profile.save!
  #     end
  #     redirect_to users_path
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   @profile.assign_attributes(profile_params)

  #   if submit_create? && @profile.valid?
  #     Profile.transaction do
  #       @profile.build_icon.file.retrieve_from_cache!(icon_params) if icon_params.present?
  #       @profile.save!
  #     end
  #     redirect_to users_path
  #   else
  #     render :edit
  #   end
  # end

  # private

  # profileが存在する場合はeditへ飛ばす
  def vaidate_existance
    redirect_to edit_profile_path if current_user.profile
  end

  def set_profile
    # @profile = current_user.profile
  end

  # def profile_params
  #   params.fetch(:profile, {}).permit(
  #     :email, :hospital_name, :prefecture_id, :city,
  #     careers_attributes: [:id, :profile_id, :name, :_destroy],
  #     profile_medical_courses_attributes: [:id, :profile_id, :medical_course_id, :_destroy],
  #     affiliations_attributes: [:id, :profile_id, :name, :_destroy]
  #   )
  # end

  # def icon_params
  #   params.dig(:profile, :icon, :file) || params[:icon_file_cache_name]
  # end

  def submit_create?
    params[:commit] == 'aaa'
  end
end
