
class ProfileSerializer < ActiveModel::Serializer 
  attributes  %i[id user_id email city tell avatar]

  belongs_to :user
  belongs_to :prefecture
  has_many :game_careers, dependent: :destroy
  has_many :possess_games, dependent: :destroy
  has_many :games, through: :possess_games, source: :game_console
end
