

#Look into storing cards into an array to access at a later point. That way we can do for example: 
#if array.include?("Ace of hearts"||"Ace of spades"...etc)
#  then card = 1 or 11
#end

puts "Its time to play some black jack!"

 @deck = [
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

def initial_deal 

  @user_count = 0
  
  x = rand(@deck.length)

  @user_count = @user_count + @deck[x][@deck[x].keys[0]]

  puts "you got the #{@deck[x].keys[0]}" 

  @deck.delete_at(x)
  
  #repetition below----fix this!
  
  @dealer_count = 0
  
  x = rand(@deck.length)

  @dealer_count = @dealer_count + @deck[x][@deck[x].keys[0]] 
  
  @hidden_card = @deck[x].keys[0]

  @deck.delete_at(x)
  
  #repetiton below---fix this!
  x = rand(@deck.length)

  @user_count = @user_count + @deck[x][@deck[x].keys[0]]

  puts "you got the #{@deck[x].keys[0]}" 

  @deck.delete_at(x)
  
  puts "your total is #{@user_count}"
  
  #repetiton below---fix this!
  
  x = rand(@deck.length)

  @dealer_count = @dealer_count + @deck[x][@deck[x].keys[0]] 

  puts "the dealer is showing a #{@deck[x].keys[0]}" 
  
  @deck.delete_at(x)
  
end 
  
initial_deal

while @user_count < 21

  puts "would you like to hit again? enter 'yes or 'no'"
  
  user_input = gets.chomp.downcase
  break if user_input == 'no'
  
  if user_input == 'yes'
    x = rand(@deck.length)

    @user_count = @user_count + @deck[x][@deck[x].keys[0]]

    puts "you got the #{@deck[x].keys[0]}" 

    @deck.delete_at(x)
    
    puts "your total is #{@user_count}"

  end
end

if @user_count > 21
  puts "you went bust! Sorry, dude"
  abort
end

puts "the dealer's other card was a #{@hidden_card} that gives the dealer a total count of #{@dealer_count}"



while @dealer_count < 17
  puts "the dealer is going to have to hit again"
  
  x = rand(@deck.length)
  
  @dealer_count = @dealer_count + @deck[x][@deck[x].keys[0]] 
  
  puts "the dealer drew a #{@deck[x].keys[0]}, that gives them a #{@dealer_count}"
  
  @deck.delete_at(x)
  
  if @dealer_count > 21
    puts "the dealer went bust! You win all the magic internet money!!!"  
    abort
  end
  
end


if @dealer_count >= @user_count
  puts "the dealer wins! Sorry, dude"
else 
  puts "You win all the magic internet money!"
end









 