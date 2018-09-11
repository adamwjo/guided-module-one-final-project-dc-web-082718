class Querie

# Find average age of players of passed in game
  def self.find_average_age_of_game(game_object)
    #
    ages = Player.all.collect do |player| ## Retrieves array of all player objects
      # checks to see if players game array contains the passed in game
      if player.games.include?(game_object)
        # collects the players age
        player.age
      end
    end.compact #Removes nil space
    average = ages.sum.to_f/ages.length.to_f #Average = total/number of instances
  end

  def self.game_players(game_object)
    #collects array of game player
    game_object.players.collect do |player|
      player.name
    end
  end

# returns list of player names of players from the same area as passed in player
  def self.other_players_from_same_location(player_object)
    # collects player name
    players = Player.all.collect do |player|
      # checks to see if location matches passed in players location
      if player.location == player_object.location
        player.name
      end
    end.compact
    # deletes passed in players name out of collection
    players.delete(player_object.name)
    players
  end


end
