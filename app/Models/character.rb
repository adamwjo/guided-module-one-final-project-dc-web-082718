class Character<ActiveRecord::Base
  belongs_to :match
  has_many :players, through: :Gamesession
end
