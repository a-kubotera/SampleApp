class GameCareerSerializer < ActiveModel::Serializer
  attributes  %i[id profile_id name]

  belongs_to :profile
end
