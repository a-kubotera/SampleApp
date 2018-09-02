
class Api::V1::ProfilesController < ActionController::Base
  def index
    @profiles = Profile.all
    render json:@profiles
  end
  def show
    @profile = Profile.first
  end  
end
