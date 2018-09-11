class CommandLineInterface

  #   "Login or create Username: "
    # if Player.find_by(name: input)
    #   player Player.find_by(name:input)
    #   "We found your exiting account and logged in!"
    #
    # else
    #
    #   Player.create(:username)
    #   "no extisting account found please enter your age"
    #   "please enter your location"
    # end

  def run
    greet
    create_an_account
  end


  def greet
    puts "Welcome to Game Master 3000!"
    puts "Please Login"
  end

  def get_user_input
    gets.chomp
  end



  def create_an_account
    puts "Please enter Username:"
    name = get_user_input
    if Player.find_by(name: name)
      puts "You already have an account, enjoy!"
    else
      Player.create(name: name)
      puts "Account Created!"
    end
  end

end
