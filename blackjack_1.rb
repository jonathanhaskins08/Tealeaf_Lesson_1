# make the deck
# deal/show two random cards to player
# deal two random cards to computer/show one
# ask player if they want to hit
#   if no then end
#     if yes then get another random card from the deck
# ask comp if it wants to hit
# compare the player hand and comp hand
# announce winner

# methods:
  
## deck
#give cards value, even face cards
# get card(deck)
# hit-using get card inside(deck)
#   "would you like to hit?"
# comp_hit-
#   if hand>= 16 
#     then get card
# compare_hands(user_hand, comp_hand)
#   compare hands
#   if user_hand won then winner = user_hand
#   if comp_hand won then winner = comp_hand
# announce winner

def initialize_deck
  deck = []
  suits = ['Spades', 'Clubs', 'Diamonds', 'Hearts']
  face = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  deck = face.product(suits)
  deck.shuffle!
end

def get_card(deck)
  card = deck.pop
  puts "Your card is #{card}"
end

def hit (hand, deck)
  hand << deck.pop
  hand
end

def hand_total(hand)
  h = hand.map{ |c| c[0]}
  total = 0
  h.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else 
      total += value.to_i
    end
  end
  h.select { |e| e == 'A'}.count.times do
    if total > 21
      total -= 10
    end
  end
  total
end

def show_cards(hand)
  cards = hand.map { |s| "#{s[0]} of #{s[1]}"}
  puts "Your cards are: #{cards}"
  puts "  Hand Total: #{hand_total(hand)}"
end

def show_comp_card(hand)
  cards = hand.map { |s| ["#{s[0]} of #{s[1]}"]}
  puts "Dealer is showing: #{cards[0]}"

end

def user_hit(hand, deck)
  loop do
    puts 'Do you want to hit or stay? (hit/stay)'
    answer = gets.chomp.downcase
    if answer == 'hit'
      hit(hand, deck)
      show_cards(hand)
      if hand_total(hand) > 21
        puts "You busted!!"
        break
      end
    else
      break
    end
  end
  hand
end

def comp_hit(hand, deck)
  begin
    if hand_total(hand) < 16
      hit(hand, deck)
    end
  end until hand_total(hand) >= 16
  if hand_total(hand) >21
    puts "*** Dealer Busted ***"
  end
  hand
end

def show_comp_final_cards(hand)
  cards = hand.map { |s| "#{s[0]} of #{s[1]}"}
  puts "Dealer's cards are: #{cards}"
  puts " *Hand Total: #{hand_total(hand)}"
end

def compare_hands(user_hand, comp_hand)
  puts show_comp_final_cards(comp_hand)
  if hand_total(user_hand) == 21
    puts "$$$ Blackjack! You win! $$$"
  elsif hand_total(comp_hand) == hand_total(user_hand)
    puts "You tied!"
  elsif (hand_total(comp_hand) > 21) && (hand_total(user_hand) <= 21)
    puts "You win!"
  elsif (hand_total(user_hand) > hand_total(comp_hand)) && (hand_total(user_hand) <= 21)
    puts "You win!"
  elsif hand_total(comp_hand) <= 21
    puts "Dealer Wins. Good luck next hand!"
  else
    puts "You both busted!!"
  end
end

loop do
  system 'clear'
  deck = initialize_deck
  puts "Welcome to the Command Prompt Casino and may the odds be ever in your favor."
  puts "Now lets get our BlackJack on!!\n"
  user_hand = []
  comp_hand = []
  user_hand << deck.pop
  comp_hand << deck.pop
  user_hand << deck.pop
  comp_hand << deck.pop
  show_cards(user_hand)
  show_comp_card(comp_hand)
  user_hit(user_hand, deck)
  comp_hit(comp_hand, deck)
  compare_hands(user_hand, comp_hand)
  puts 'Would you like to play again? (yes/no)'
  replay = gets.chomp.downcase
  if replay != 'yes'
    break
  end
end












