class Querie

  def self.find_average_age_of_game(game)
    ages = Player.all.collect do |player|
      if player.games.include?(game1)
        player.age
      end
    end.compact

    average = ages.sum.to_f/ages.length.to_f
  end

end
