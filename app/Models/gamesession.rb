class GameSession < ActiveRecord::Base
  has_many :players
  has_many :characters
end
