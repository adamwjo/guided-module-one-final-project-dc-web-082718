class Querie

# Find average age of players of passed in game
  def self.find_average_age_of_game(game)
    #
    ages = Player.all.collect do |player| ## Retrieves array of all player objects
      # checks to see if players game array contains the passed in game
      if player.games.include?(game1)
        # collects the players age
        player.age
      end
    end.compact #Removes nil space
    average = ages.sum.to_f/ages.length.to_f #Average = total/number of instances
  end

  def self.game_players(game)
    #collects array of game player
    game.players.collect do |player|
      player.name
    end
  end


end
