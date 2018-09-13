require_relative '../config/environment.rb'

describe 'Querie' do
  let (:checker) { Querie.new }
  it 'It lists all the games a player is currently playing' do
    expect(checker.list_game_names_of_player(player5)).to be(true)
  end
end
