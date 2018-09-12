require "pry"
class CLI
  attr_accessor :user


  def run
    greet
    create_an_account
    system "clear"
    update_age
    system "clear"
    update_location
    system "clear"
    input = main_program_introduction
    if input == "1"
      puts "Lets add a game to your account"
      input = get_user_input
      add_game(input)
      #my game screen
    elsif input == "2"
      puts "Which Game Would you like to know more about"
      Querie.list_of_game_names
      puts "Please type in the name of the game you would like to know more about"
      input = get_user_input
      game = Game.find_by(name: input)
      puts "What would you like to know"
      puts "1. Game Genre"
      puts "2. Average player age"
      puts "3. Breakdown of Game Players by country"
      puts "4. What other users are playing this game"
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
    get_user_input
  end

  def get_user_input
    gets.chomp
  end

# ************************************************

  def create_an_account
    puts "Please enter Username:"
    name = get_user_input
    @user = Player.find_by(name: name)
    # binding.pry
    if user
      puts "You already have an account, enjoy!"
    else
      @user = Player.create(name: name)
      puts "Account Created!"
    end
  end

  def update_age
    puts "please update your age"
    @user.age = get_user_input
    @user.save
  end

  def update_location
    puts "please update your location by picking a number below"
    puts "1.) US\n2.) France\n3.) Mexico\n4.) Spain\n5.) Russia"
    new_location = get_user_input.to_i
    if new_location > 5 || new_location < 1
      puts "you fucked up"
    elsif new_location == 1
      @user.location = "US"
      @user.save
    elsif new_location == 2
      @user.location = "France"
      @user.save
    elsif new_location == 3
      @user.location = "Mexico"
      @user.save
    elsif new_location == 4
      @user.location = "Spain"
      @user.save
    elsif new_location == 5
      @user.location = "Russia"
      @user.save
    end
  end

  def add_game(input)
    if Game.find_by(name: input)
      game = Game.find_or_create_by(name:input )
      @user.games << game
    else
      game = Game.find_or_create_by(name:input )
      puts "This Game was previosly not in our Database Please enter a game Genre"
      input = get_user_input
      game.genre = input
      game.save
      puts "added to our Database!"
    end
    #choose from existing games to add to account
    #list games
    #get user input
    #if the game doesnt exist add a new game
  end

  def get_game_info
    #puts "Please enter a game you wish to know more about"
    #what would you like to know?
        #type,
        #average player age,
        #players who play that game
        #location of players who play that game
  end

  def get_info_on_players
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
