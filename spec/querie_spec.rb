require_relative '../config/environment.rb'

describe 'Querie' do
  let (:checker) { Querie.new }

  it 'It lists all the games a player is currently playing' do
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


end
