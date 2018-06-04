class GameCareer < ApplicationRecord
  belongs_to :profile
  validates :name, presence: true, length: { maximum: 50 }
end
