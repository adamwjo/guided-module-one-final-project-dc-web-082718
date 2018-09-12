require 'require_all'
require_relative '../config/environment.rb'


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


game1 = Game.find_or_create_by(name: "Grand Theft Auto", genre: "Action-Adventure")
game2 = Game.find_or_create_by(name: "Halo", genre: "First Person Shooter")
game3 = Game.find_or_create_by(name: "Far Cry", genre: "Action-Adventure")
game4 = Game.find_or_create_by(name: "Overwatch", genre: "First Person Shooter")
game5 = Game.find_or_create_by(name: "Leage of Legends", genre: "Multiplayer Online")


game1.players << [player1, player2, player3, player4, player5]
game2.players << [player6, player7, player8, player9]
game3.players << [player8, player9]
game3.players << [player10, player11, player12, player1, player2]
game4.players << [player12, player6, player7, player10]
