class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many :game_careers, dependent: :destroy
  has_many :possess_games, dependent: :destroy
  has_many :games, through: :possess_games, source: :game_console

  accepts_nested_attributes_for :game_careers, :possess_games, allow_destroy: true
end
