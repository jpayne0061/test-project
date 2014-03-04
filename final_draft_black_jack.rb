 
 puts "Welcome to Blackjack!"
 puts "Press 'Enter' to deal out the cards!"
 gets.chomp
 
 puts "--------------------------------------"
 
 deck = [
  {"2 of hearts"=>        2},
  {"3 of hearts"=>        3},
  {"4 of hearts"=>        4},
  {"5 of hearts"=>        5},
  {"6 of hearts"=>        6},
  {"7 of hearts"=>        7},
  {"8 of hearts"=>        8},
  {"9 of hearts"=>        9},
  {"10 of hearts"=>      10},
  {"jack of hearts"=>    10},
  {"queen of hearts"=>   10},
  {"king of hearts"=>    10},
  {"Ace of hearts"=>     11},
  {"2 of clubs"=>         2},
  {"3 of clubs"=>         3},
  {"4 of clubs"=>         4},
  {"5 of clubs"=>         5},
  {"6 of clubs"=>         6},
  {"7 of clubs"=>         7},
  {"8 of clubs"=>         8},
  {"9 of clubs"=>         9},
  {"10 of clubs"=>       10},
  {"jack of clubs"=>     10},
  {"queen of clubs"=>    10},
  {"king of clubs"=>     10},
  {"Ace of clubs"=>      11},
  {"2 of diamonds"=>      2},
  {"3 of diamonds"=>      3},
  {"4 of diamonds"=>      4},
  {"5 of diamonds"=>      5},
  {"6 of diamonds"=>      6},
  {"7 of diamonds"=>      7},
  {"8 of diamonds"=>      8},
  {"9 of diamonds"=>      9},
  {"10 of diamonds"=>    10},
  {"jack of diamonds"=>  10},
  {"queen of diamonds"=> 10},
  {"king of diamonds"=>  10},
  {"Ace of diamonds"=>   11},
  {"2 of spades"=>        2},
  {"3 of spades"=>        3},
  {"4 of spades"=>        4},
  {"5 of spades"=>        5},
  {"6 of spades"=>         6},
  {"7 of spades"=>        7},
  {"8 of spades"=>        8},
  {"9 of spades"=>        9},
  {"10 of spades"=>      10},
  {"jack of spades"=>    10},
  {"queen of spades"=>   10},
  {"king of spades"=>    10},
  {"Ace of spades"=>     11}
  ]
  deck.shuffle!
  
  def count(cards)
    total = 0
    x=(cards.length) -1
    while x > -1
      total += cards[x][cards[x].keys[0]]
      x-=1
    end
    cards.map do |hash|
    hash.select do |x,y|
      x == "Ace of spades" || x == "Ace of clubs"||x == "Ace of hearts" || x == "Ace of diamonds"end.count.times { total -= 10 if total > 21}
    end 
    total
  end
  
  user_cards = []
  dealer_cards = []
  user_count = 0
  dealer_count = 0
  
  #initial deal
  user_cards << deck.pop
  dealer_cards << deck.pop
  user_cards << deck.pop
  dealer_cards << deck.pop
  
  #card counts
  user_count = count(user_cards)
  dealer_count = count(dealer_cards)
  
  puts "you got the #{user_cards[0].keys[0]} and the #{user_cards[1].keys[0]}"
  
  puts "this gives you a total of #{user_count}"
  puts ""
  puts "the dealer is showing the #{dealer_cards[1].keys[0]}"
  puts ""
  
  while user_count < 21
    puts "would you like to hit again? enter '1' for yes or 2 'no'"    
    user_input = gets.chomp
    
    if user_input == '2'
      puts "you chose to stay, press 'Enter' to see dealer's other card"
      gets.chomp
      break
    end
    
    if user_input == '1'
      user_cards << deck.pop  
      user_count = count(user_cards)
      puts "you got the #{user_cards[-1].keys[0]}"
      puts ""
      puts "your total is #{user_count}"

    end
  end
  
  if user_count == 21
    puts "you got a blackjack! Awesome!" 
    puts "press 'Enter' to see what the dealer has"
    gets.chomp
  elsif user_count > 21
    puts "You went bust! Ouch! Dealer wins"
    exit 
  end
  
  puts "the dealer's other card was a #{dealer_cards[0].keys[0]}"
  puts "this gives them a total of #{dealer_count}"
  
  if dealer_count < 17
    puts "press 'Enter' to make the dealer start drawing cards"
    gets.chomp
  end
  
  while dealer_count < 17 
    dealer_cards << deck.pop
    puts "Dealing new card for dealer: #{dealer_cards[-1].keys[0]}"   
    dealer_count = count(dealer_cards)
    puts "Dealer total is now: #{dealer_count}"

    if dealer_count == 21
      puts "dealer hits blackjack. you lose"
      exit
    elsif dealer_count > 21
      puts "Congrats, dealer busted! YOU win!"
      exit
    end
  end
  
  puts "Dealer's cards: "
  dealer_cards.each do |card|
    card.each do |x,y|
      puts x
    end
  end
  puts ""

  puts "Your cards: "
  user_cards.each do |card|
    card.each do |x,y|
      puts x
    end
  end

  puts ""

  if dealer_count > user_count
    puts "You lost! Loser McLoserson!"
  elsif dealer_count < user_count
    puts "congrats, you win all magic internet money!"
  else  
    puts "Its a tie! boo..."
  end

  exit
  
  
  
  
  