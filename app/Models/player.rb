class Player < ActiveRecord::Base
  belongs_to :match
  has_many :characters, through: :Gamesession
end
