class Games < ActiveRecord::Base
  has_many :playergames
  has_many :players, through: :playergames
end