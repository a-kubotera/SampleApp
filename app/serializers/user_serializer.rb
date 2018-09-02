class UserSerializer < ActiveModel::Serializer
  attributes  %i[id name]

  has_one :profile, dependent: :destroy
end
