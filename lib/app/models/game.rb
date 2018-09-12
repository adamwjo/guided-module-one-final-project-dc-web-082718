class Game < ActiveRecord::Base
  has_many :player_games
  has_many :players, through: :player_games

  def self.import_from_csv(filepath)
    CSV.foreach(filepath, headers: true) do |row|
      name = row.to_h.values[0]
      genre = row.to_h.values[1]
      Game.find_or_create_by(name: name, genre: genre)
    end
  end


end
