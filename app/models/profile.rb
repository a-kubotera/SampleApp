class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many :game_careers, dependent: :destroy
  has_many :possess_games, dependent: :destroy
  has_many :games, through: :possess_games, source: :game_console

  accepts_nested_attributes_for :game_careers, :possess_games, allow_destroy: true

  # 正規表現を定義
  include RegularExpression

  validates :user_id, uniqueness: { scope: :user_id }
  validates :email, uniqueness: true, presence: true, format: { with: MAIL_REGEX, message: I18n.t('errors.messages.illegal_format')}
  validates :prefecture_id, presence: true
  validates :city, presence: true, length: { maximum: 50 }
  validates :tell, format: { with: TELL_REGEX, message: I18n.t('errors.messages.illegal_format')}
  validates :game_careers, nested_unique: { column: :name }, length: { minimum: 1, message: I18n.t('errors.messages.required') }
  validates :possess_games, nested_unique: { column: :game_console_id }
end
