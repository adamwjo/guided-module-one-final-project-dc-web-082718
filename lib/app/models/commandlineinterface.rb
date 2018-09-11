class CommandLineInterface

  def run
    greet
    input = gets_user_input.to_i
    if input == 1
      create_an_account
    end
  end


  def greet
    puts "Welcome to Game Master 3000!"
    puts "Lets begin!"
  end

  def gets_user_input
    puts "Choose an option:\n 1.)Create an account\n 2.)See whose playing\n 3.)Start_playing"
    input = gets.chomp
    # if input > 3
    #   puts "invalid input"
    # end
  end



  def create_an_account
    puts "What is your name?"
    name = gets.chomp
    puts "What is your location"
    location = gets.chomp
    puts "What is your age"
    age = gets.chomp
  end

end
