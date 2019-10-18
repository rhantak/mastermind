require './lib/mastermind'

puts "Welcome to MASTERMIND\n"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
print "> "
user_input = gets.chomp.downcase

until user_input == "q"

  if !["q", "i", "p"].include?(user_input)
    puts "Please enter a valid command."
    print ">"
    user_input = gets.chomp.downcase
  end

  if user_input == "i"
    puts "The computer will randomly generate a secret code, consisting of some"
    puts "combination of 4 colors, (r)ed, (g)reen, (b)lue, and (y)ellow."
    puts "Your job is to guess the correct colors in the correct order in as few"
    puts "guesses as you can! Press (p) to play or (q) to quit."
    print "> "
    user_input = gets.chomp.downcase
  end

  if user_input == "p"
    mm = Mastermind.new
    puts "I have generated a beginner sequence with four elements made up of: "
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end "
    puts "the game. What's your guess?"
    print "> "

    win = false
    until win
      user_guess = gets.chomp.downcase
      good_guess = false

      until good_guess
          if user_guess.length < 4 && (user_guess !="c" && user_guess!="q")
            puts "The sequence has four elements! Your guess is too short."
          elsif user_guess.length > 4 && (user.guess !="c" && user.guess!="q")
            puts "The sequence only has four elements! Your guess is too long."
          else
            good_guess = true
          end
      end

      stats = mm.guess(user_guess)
      if user_guess == mm.code.join
        win = true
      elsif user_guess == "c"
        puts "#{mm.code}"
        puts "What is your next guess?"
        print "> "
      elsif user_guess == "q"
        user_input = "q"
        break
      else
        puts "'#{user_guess}' has #{stats[0]} of the correct elements."
        puts "#{stats[1]} of the elements are in the correct position."
        puts "You have taken #{mm.guesses} guess(es)."
        puts "What is your next guess?"
        print ">"
      end
    end
    unless user_guess == "q"
      puts "\nCongratulations! You guessed the sequence '#{mm.code}' in #{mm.guesses} guesses!"
      puts "Do you want to (p)lay again or (q)uit?"
      print "> "
      user_input = gets.chomp.downcase
    end
  end

end

puts "Thanks for playing Mastermind! Goodbye."
