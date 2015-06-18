#welcome

# player chooses a spot
# comp chooses a spot
# until there is a winner or all spots are taken

# welcome
# please choose a spot
#   choose spot
#   reprint board
#   check for winner or tie
# comp chooses a spot
#   reprint board
#   check for winner of tie
# would you like to play again?

#change keys for space into int and add them into  a total and check if they % 3 == 0

def intialize_board()
  space = {}
  (1..9).each { |position| space[position] = ' ' }
  space
end

def empty_positions (space)
  space.keys.select { |position| space[position] == ' ' } 
end

def user_move(space)
  begin
    puts 'Pick a square (1-9)'
    position = gets.chomp.to_i
  end until empty_positions(space).include?(position)    
  space[position] = 'X'
  draw_board(space)
end

def comp_move(space)
  begin
    position = empty_positions(space).sample
  end until empty_positions(space).include?(position)    
  space[position] = 'O'
  draw_board(space)
end

def check_for_winner(space)
  winning_lines = [[1, 2, 3,], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    return "Player" if space.values_at(*line).count('X') == 3
    return "Computer" if space.values_at(*line).count('O') == 3
  end
  nil
end

def all_positions_are_filled?(space)
  empty_positions(space) == []
end


def draw_board(space)
  system 'clear'
  puts "   #{space[1]} | #{space[2]} | #{space[3]}"
  puts " -------------"
  puts "   #{space[4]} | #{space[5]} | #{space[6]}"
  puts " -------------"
  puts "   #{space[7]} | #{space[8]} | #{space[9]}"
end




loop do
  space = intialize_board
  draw_board(space)
  puts "Welcome to another engaging round of Tic-Tac-Toe"
  begin
    user_move(space)
    comp_move(space)
    winner = check_for_winner(space)
  end until winner || all_positions_are_filled?(space)
  if winner
    puts "#{winner} won!"
  else
    puts "Tie Game!"
  end
  puts "Would you like to try again?? (y/n) "
  replay = gets.chomp
  if replay != "y"
    break
  end
end











