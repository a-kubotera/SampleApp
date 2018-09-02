class PossessGameSerializer < ActiveModel::Serializer
  attributes  %i[id profile_id game_console_id]  
  belongs_to :profile
  belongs_to :game_console
end
