
class Api::V1::ProfilesController < ActionController::Base
  def index
    @profiles = Profile.all
    render json:@profiles, include: %i[user prefecture game_careers games ], status:'OK'
  end
end
