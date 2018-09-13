require "pry"
class CLI
  attr_accessor :user

#*******************RUNNER METHODS*********************************
  def run
    greet
    create_or_login_to_an_account
    puts "Great you are all ready to start!"
    run_without_greeting
  end

  def run_without_greeting
    input = main_program_introduction
    if input > 5 || input < 1
      run_without_greeting
    end
    if input == 1
      add_game
    elsif input == 2
      get_game_info_menu
    elsif input == 3
      get_player_info_menu
    elsif input == 4
      my_games
    elsif input == 5
      puts " _______  _______  _______  ______   ______            _______  _
(  ____ \(  ___  )(  ___  )(  __  \ (  ___ \ |\     /|(  ____ \( )
| (    \/| (   ) || (   ) || (  \  )| (   ) )( \   / )| (    \/| |
| |      | |   | || |   | || |   ) || (__/ /  \ (_) / | (__    | |
| | ____ | |   | || |   | || |   | ||  __ (    \   /  |  __)   | |
| | \_  )| |   | || |   | || |   ) || (  \ \    ) (   | (      (_)
| (___) || (___) || (___) || (__/  )| )___) )   | |   | (____/\ _
(_______)(_______)(_______)(______/ |/ \___/    \_/   (_______/(_)"
    end
  end

 # ****************HELPER METHODS**********************************
  def greet
    puts "╔═╗╦  ╔═╗╔╦╗╦╦═╗╔═╗╔╗╔  ╔═╗╔═╗╔╦╗╔═╗  ╦  ╔═╗╔╗ ╔╗ ╦ ╦
╠╣ ║  ╠═╣ ║ ║╠╦╝║ ║║║║  ║ ╦╠═╣║║║║╣   ║  ║ ║╠╩╗╠╩╗╚╦╝
╚  ╩═╝╩ ╩ ╩ ╩╩╚═╚═╝╝╚╝  ╚═╝╩ ╩╩ ╩╚═╝  ╩═╝╚═╝╚═╝╚═╝ ╩"
    puts "press enter to start"
    input = gets
    if input == "\n"
      system "clear"
      puts "ready to begin"
    end
  end

  def main_program_introduction
    puts "what would you like to do?"
    puts "1.)add a game to your account\n 2.)get game info\n 3.)get info on other players\n 4.)List My Games\n 5.)Exit Lobby"
    input = get_user_input.to_i
    # Checks if user input is valid
    system "clear"
    if input > 5 || input < 1
      puts "Please enter a valid input".colorize(:red)
      # If input is invalid recall the method
      input = main_program_introduction
    end
    input
  end

  def get_user_input
    gets.chomp
  end


  def create_or_login_to_an_account
    puts "Please login with your Username:"
    name = get_user_input.split.map(&:capitalize).join(' ').strip
    # Gets user account
    @user = Player.find_by(name: name)
    # Checks if user exists
    if user
      system "clear"
      puts "You already have an account and are now logged in, enjoy!"
    else
      system "clear"
      # Creates player object if user does not already exist
      @user = Player.create(name: name)
      # Prompts user for additional required information
      puts "Account Created!".colorize(:blue)
      update_age
      system "clear"
      update_location
      system "clear"
    end
  end
  # *****************LOGIN SCREEN*******************************

  def update_age
    puts "please enter your age"
    input = get_user_input.to_i
    if input == 0
      system "clear"
      puts "Invalid Input".colorize(:red)
      update_age
    else
    @user.age = input
    @user.save
  end
  end

  def update_location
    puts "please enter your location by picking a number below"
    puts "1.) US\n2.) France\n3.) Mexico\n4.) Spain\n5.) Russia"
    new_location = get_user_input.to_i
    if new_location > 5 || new_location < 1
      puts "Please Enter a Valid Input".colorize(:red)
      update_location
    elsif new_location == 1
      @user.location = "US"
    elsif new_location == 2
      @user.location = "France"
    elsif new_location == 3
      @user.location = "Mexico"
    elsif new_location == 4
      @user.location = "Spain"
    elsif new_location == 5
      @user.location = "Russia"
    end
    @user.save
  end

  def add_game
    system "clear"
    puts "Lets add a game to your account \nHere is a list of your current games:"
    Querie.list_game_names_of_player(@user)
    puts "Please Enter the name of the game you would like to Add"
    input = get_user_input.split.map(&:capitalize).join(' ').strip
    # Gets Game object
    game = Game.find_by(name:input )
    # Checks if game with given name exists
    if game
      # Checks if user already has game on account
      if @user.games.include?(game)
        puts "#{game.name} is already on your account!".colorize(:red)
        run_without_greeting
      else
        # Adds game to user games
        @user.games << game
        system "clear"
        puts "#{game.name} has been added to your account".colorize(:blue)
        run_without_greeting
      end
    else
      # Creates New Game if doesnt already exist
      game = Game.create(name:input )
      puts "This Game was previosly not in our Database Please enter a game Genre"
      # Adds genre to game
      input = get_user_input.split.map(&:capitalize).join(' ').strip
      game.update(genre: input)
      # Adds game to user account
      @user.games << game
      system "clear"
      puts "#{game.name} has been added to your account!".colorize(:blue)
      run_without_greeting
    end
  end

#*******************GAME MENU***********************************
  def get_game_info_menu
    puts "Which Game Would you like to know more about"
    Querie.list_of_game_names
    puts "Please type in the name of the game you would like to know more about"
    input = get_user_input.split.map(&:capitalize).join(' ').strip
    game = Game.find_by(name: input)
    if game == nil then puts "game not in datebase"
      system "clear"
      get_game_info_menu
    end
    puts "What Would You Like to Know \n 1. Game Genre \n 2. Average Player Age \n 3. Breakdown of Game Players by Country \n 4. What other Users are Playing this Game"
    input = get_user_input.to_i
    if input == 1
      system "clear"
      puts "#{game.name} is a #{game.genre}".colorize(:blue)
      run_without_greeting
    elsif input == 2
      system "clear"
      Querie.find_average_age_of_game(game)
      run_without_greeting
    elsif input == 3
      system "clear"
      Querie.game_player_breakdown_by_location(game)
      run_without_greeting
    elsif input == 4
      system "clear"
      Querie.game_players(game)
      run_without_greeting
    end
  end
#****************PLAYER INFO MENU**************************************
  def get_player_info_menu
    system "clear"
    puts "What would you like to know?\n 1.)Who is logged in right now?\n 2.) Which players are from my country?\n 3.)Who is playing the same game as me?"
    input = get_user_input.to_i
    if input == 1
      puts "Here are the current users who are logged in "
      system "clear"
      Querie.current_logged_in_players
      run_without_greeting
    elsif input == 2
      system "clear"
      puts "Here are user's in your area:"
      Querie.other_players_from_same_location(@user)
      run_without_greeting
    elsif input == 3
      system "clear"
      puts "These users are playing the same game(s) as you:"
      Querie.players_who_share_games_with(@user)
      run_without_greeting
    end


    # Querie.list_game_names_of_player
    # which players are from my area
    # what players play the same game as me
  end
#*******************GAME INFO****************************************************
  def my_games
    # display_games
    # add_game
    # remove games
    Querie.list_game_names_of_player(@user)
    puts "Would you like to: \n 1) Add a Game to Your Collection \n 2) Remove a Game From Your Collection \n 3)Return to Main Menu"
    input = get_user_input.to_i
    if input > 3 || input < 1
      puts "Please Enter a Valid Input".colorize(:red)
      my_games
    elsif input == 1
      add_game
    elsif input == 2
      if @user.games.empty?
        system "clear"
        puts "You Have No Games in Your Collection!".colorize(:red)
        my_games
      else
        system "clear"
        puts "What game would you like to remove?"
        Querie.list_game_names_of_player(@user)
        input = get_user_input.split.map(&:capitalize).join(' ').strip
        game_to_delete = Game.find_by(name: input)
        if game_to_delete == nil
          puts "Please Enter a Valid Input".colorize(:red)
          return my_games
        else
        @user.games.delete(game_to_delete)
        system "clear"
        puts "#{game_to_delete.name} has been removed from your collection".colorize(:blue)
        run_without_greeting
      end
    end
    elsif input == 3
      system "clear"
      run_without_greeting
    end
  end
end
