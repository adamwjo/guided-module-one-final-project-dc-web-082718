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

# prodies break down of number of players by locaiton for passed in game_object
  def self.game_player_breakdown_by_location(game_object)
    # intialized empty locations hash to store location breakdown
    locations = {}
    # collects array of player locations for given game
    location_array = game_object.players.collect do |player|
      player.location
    end
    location_array.uniq do |location|
      # creates locations hash with locations keys pointing to number of players from that area
      locations[location] = location_array.count(location)
    end
    locations

  end




end
