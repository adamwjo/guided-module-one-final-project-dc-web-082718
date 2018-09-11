require "pry"
class CLI
  attr_accessor :user


  def run
    # greet
    # create_an_account
    # update_age
    update_location
  end

 # ***********************************************
  def greet
    puts "Welcome to Game Master 3000!"
    puts "Please Login"
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
      Player.create(name: name)
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
    if new_location != 1..5
      puts "you fucked up"
    elsif new_location == 1
      @user.location = "US"
      @user.save
    end
  end

end





# new_cli = CLI.new
# new_cli.create_an_account
