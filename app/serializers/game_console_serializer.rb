
class GameConsoleSerializer < ActiveModel::Serializer
  attributes  %i[id name]
  has_many :possess_games
  has_many :profiles, through: :possess_games
end
