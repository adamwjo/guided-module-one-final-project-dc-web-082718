require 'require_all'
require_relative '../config/environment.rb'
require './app/models/player.rb'
require './app/models/playergames.rb'
require './app/models/game.rb'



player1= Player.find_or_create_by(name: "player1")
player2= Player.find_or_create_by(name: "player2")
player3= Player.find_or_create_by(name: "player3")
player4= Player.find_or_create_by(name: "player4")

game1 = Game.find_or_create_by(name: "game1")
game2 = Game.find_or_create_by(name: "game2")
game3 = Game.find_or_create_by(name: "game3")
game4 =Game.find_or_create_by(name: "game4")

player1.location = "EU"
player2.location = "AM"
player3.location = "AM"
player4.location = "EU"

player1.age = 22
player2.age = 14
player3.age = 17
player4.age = 19
