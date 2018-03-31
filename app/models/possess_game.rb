class PossessGame < ApplicationRecord
  belongs_to :profile
  belongs_to :game_console
end
