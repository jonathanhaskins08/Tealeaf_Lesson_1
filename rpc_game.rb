def congrats(choice)
  case choice
  when "r"
    puts "Rock smashes scissors!"
  when "p"
    puts "Paper covers rock!"
  when "s"
    puts "Scissors cut paper!"
  end
end

def game(user_choice, comp_choice)
    if user_choice == comp_choice
      puts "It's a tie!"
    elsif  (user_choice == "r" && comp_choice != "p") || (user_choice == "p" && comp_choice != "s") || (user_choice == "s" && comp_choice != "r")
      puts "****** You win! *******"
      congrats(user_choice)
    else
      puts "Computer Wins!"
      congrats(comp_choice)
    end
end

loop do
  puts "Welcome to another exciting round of...\n"
  puts "Rock-Paper-Scissors!!!!!\n" 

  begin
    puts "Please choose Rock (r), Paper (p), or Scissors (s):"
    user_choice = gets.chomp.downcase
  end until %w(r p s).include?(user_choice)

  comp_choice = %w(r p s).sample
  game(user_choice, comp_choice)
  puts "Would you like to play again?(y/n)"
  replay = gets.chomp.downcase
  if replay == "n"
    break
  end
end