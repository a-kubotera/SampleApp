class Profile < ApplicationRecord
  belongs_to :user
  has_many :game_careers, dependent: :destroy
  has_many :possess_games, dependent: :destroy
  has_many :games, through: :possess_games, source: :game_console
end
