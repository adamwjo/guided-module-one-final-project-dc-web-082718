require_relative '../config/environment.rb'

describe 'Querie' do
  let (:checker) { Querie.new }

  it 'Game_players method lists all the games a player is currently playing' do
    player1= Player.new(name:"Billy", location: "US", age:21)
    game1 = Game.new(name: "ABC")
    game2 = Game.new(name: "EFG")
    player1.games << [game1, game2]
    expect(Querie.list_game_names_of_player(player1)).to eq(["ABC", "EFG"])
  end

  it 'The list of names contains no nil values' do
    player1= Player.new(name:"Billy", location: "US", age:21)
    game1 = Game.new(name: "ABC")
    game2 = Game.new(name: "EFG")
    player1.games << [game1, game2]
    expect(Querie.list_game_names_of_player(player1)).not_to include(nil)
  end

  it "find_average_age_of_game method returns average age of players" do
    player1= Player.new(name:"Billy", location: "US", age:16)
    player2 =Player.new(name:"james", location: "US", age:40)
    player3 = Player.new(name:"bobby", location: "US", age:4)
    game1 = Game.new(name: "ABC")
    game1.players<< [player1, player2, player3]
    expect(Querie.find_average_age_of_game(game1)).to eq(20)
  end

  it "other_players_from_same_location returns players from same location" do
    player1 = Player.find_or_create_by(name: "Jake", location: "US", age: 23 )
    player2 = Player.find_or_create_by(name: "Josh", location: "US", age: 23)
    player3 = Player.find_or_create_by(name: "Sam", location: "France", age: 17)
    player4 = Player.find_or_create_by(name: "John", location: "Mexico", age: 19)
    player5 = Player.find_or_create_by(name: "Kyle", location: "Spain", age: 14)
    player6 = Player.find_or_create_by(name: "Joey", location: "France", age: 17)
    player7 = Player.find_or_create_by(name: "Dimitri", location: "Russia", age: 15)
    player8 = Player.find_or_create_by(name: "Drake", location: "Canada", age: 22)
    player9 = Player.find_or_create_by(name: "Bob", location: "US", age: 19)
    player10 = Player.find_or_create_by(name: "Bill", location: "Mexico", age: 19)
    player11 = Player.find_or_create_by(name: "Ted", location: "Mexico", age: 19)
    player12 = Player.find_or_create_by(name: "Mark", location: "US", age: 19)
    expect(Querie.other_players_from_same_location(player1)).to eq(["Josh","Bob","Mark"])
  end


end
