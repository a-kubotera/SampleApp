class GameConsole < ApplicationRecord
  has_many :possess_games
  has_many :profiles, through: :possess_games
end
