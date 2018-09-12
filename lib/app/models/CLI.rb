require "pry"
class CLI
  attr_accessor :user


  def run
    greet
    create_or_login_to_an_account
    input = main_program_introduction
    binding.pry
    if input == 1
      add_game
    elsif input == 2
      get_game_info_menu
    elsif input == 3
      get_player_info_menu
    elsif input == 4
      my_games
    end
  end

 # ***********************************************
  def greet
    puts "Welcome to Game Master 3000!"
    puts "Please Login"
  end

  def main_program_introduction
    puts "Great you are all ready to start!"
    puts "what would you like to do?"
    puts "1.)add a game to your account\n 2.)get game info\n 3.)get info on other players\n 4.)Listmygames"
    input = get_user_input.to_i
    # Checks if user input is valid
    if input > 4 || input < 1
      puts "Please enter a valid input".colorize(:red)
      # If input is invalid recall the method
      input = main_program_introduction
    end
    input
  end

  def get_user_input
    gets.chomp
  end

# ************************************************

  def create_or_login_to_an_account
    puts "Please enter Username:"
    name = get_user_input
    # Gets user account
    @user = Player.find_by(name: name)
    # Checks if user exists
    if user
      puts "You already have an account and are now logged in, enjoy!"
    else
      # Creates player object if user does not already exist
      @user = Player.create(name: name)
      # Prompts user for additional required information
      puts "Account Created!"
      update_age
      system "clear"
      update_location
      system "clear"
    end
  end

  def update_age
    puts "please enter your age"
    @user.age = get_user_input
    @user.save
  end

  def update_location
    puts "please enter your location by picking a number below"
    puts "1.) US\n2.) France\n3.) Mexico\n4.) Spain\n5.) Russia"
    new_location = get_user_input.to_i
    if new_location > 5 || new_location < 1
      puts "you fucked up"
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
    input = get_user_input
    # Gets Game object
    game = Game.find_by(name:input )
    # Checks if game with given name exists
    if game
      # Checks if user already has game on account
      if @user.games.include?(game)
        puts "#{game.name} is already on your account!"
      else
        # Adds game to user games
        @user.games << game
        puts "#{game.name} has been added to your account"
      end
    else
      # Creates New Game if doesnt already exist
      game = Game.create(name:input )
      puts "This Game was previosly not in our Database Please enter a game Genre"
      # Adds genre to game
      input = get_user_input
      game.update(genre: input)
      # Adds game to user account
      @user.games << game
      puts "#{game.name} has been added to your account!"
    end
  end

  def get_game_info_menu
    puts "Which Game Would you like to know more about"
    Querie.list_of_game_names
    puts "Please type in the name of the game you would like to know more about"
    input = get_user_input.to_i
    game = Game.find_by(name: input)
    puts "What Would You Like to Know \n 1. Game Genre \n 2. Average Player Age \n 3. Breakdown of Game Players by Country \n 4. What other Users are Playing this Game"
    input = get_user_input
    if input == 1
      system "clear"
      puts "#{game.name} is a #{game.genre}"
    elsif input == 2
      Querie.find_average_age_of_game(game)
    elsif input == 3
    elsif input == 4
    end
  end

  def get_player_info_menu
    # Querie.list_game_names_of_player
    # which players are from my area
    # what players play the same game as me
  end

  def my_games
    # display_games
    # add_game
    # remove games
  end




end
