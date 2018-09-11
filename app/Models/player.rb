class Player < ActiveRecord::Base
  has_many :playergames
  has_many :games, through: :playergames
end
