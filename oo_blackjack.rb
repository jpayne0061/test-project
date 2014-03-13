
#classes contain behaviors
# class Dog
#   attr_acccessor :name, :height, :weight
#   
#   
#   def initialize(name, height, weight)
#     @name = name
#     @height = height
#     @weight = weight
#     speak
#   end   
#   
#   def speak
#     puts "bark!"
#   end
#   
#   def info
#     "#{@name} is #{@height} ft tall and weighs #{@weight} lbs"
#   end  
#   
#   def update_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#     
#   end  
#   
#   
# end
# 
# teddy = Dog.new('teddy', 3, 90)

# class Card
#   attr_accessor :suit, :value
#   def initialize(s, v)
#     @suit, @value = s, v
#   end  
#   
#   def to_s
#     "This is the card! #{suit}, #{value}"
#   end  
#   
# end
# 
# 
# a = []
# ['H', 'D', 'S', 'C'].each do |suit|
#   ['2'].each do |face_value|
#   a << Card.new(suit, face_value)  
#   end
# end
# 
# b =  a[0].value.to_i + a[1].value.to_i 
# 
# 
# puts b




# class Abc
#   def hi
#     "hey"
#   end 
#   def ni
#     "ni"
#   end     
# end
# 
# class Def
#   attr_accessor :a
#   def initialize
#     @a = Abc.new
#     puts a.hi
#   end   
#   
# end
# 
# class Ghi
#   attr_accessor :name
# 
# end
# 
# elf = Ghi.new
# 
# elf.name = "Evan"
# puts elf.name
# 
# 
# class Card
#   def initialize
#     @name = name
#   end
# end

# a = [1,2,3,4]
# b = [6,7,8,9]
# c= [10,11,12,13]
# 
# def add(a,b,c)
#   puts a+b+c
# end  
# 
# 
# a.each do |x|
#   b.each do |y|
#       add(x,y)
#     end  
#   end
# end
require 'rubygems'
require 'pry'



class Deck
  attr_accessor :cards

  def initialize
    @cards = []
		['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'].each do |value|
		  ['Clubs', 'Hearts', 'Diamonds', 'Spades'].each do |suit|
			  @cards << Card.new(value, suit)  
      end          
		end 
    scramble! #does this not need "cards" to be in front of it since "cards" was returned just before it?
  end
    
	def deal_one
	  cards.pop
	end
	
	def scramble!
	  cards.shuffle!
  end
end


module Hand
  def hit(card)
    cards << card     
  end
  
  def show_hand
    puts "-----#{name}'s Hand-----"
    cards.each do |card|
      puts card.to_s
    end 
    puts "" 
    puts "Your count: #{total}" 
    puts ""
  end  
  
  
  def total
    total = 0
    
    values = cards.map {|card| card.value}
    values.each do |value|
      if         value == 'Ace'
        total += 11
      elsif value.to_i == 0   
        total += 10
      else
        total += value.to_i
      end    
    end
    
    ace_count = values.select {|value| value == 'Ace'}.length
    
    while (total > Blackjack::BLACK_J) && ace_count > 0
      ace_count -= 1
      total -= 10   
    end 
    total 
  end
  
  def busted?
    total > Blackjack::BLACK_J  
  end  
  
  
end

class Player
  include Hand
  attr_accessor :cards, :name
  
  def initialize(name)
    @name = name
    @cards = []
  end
  
  def show_flop
    show_hand
  end
end


class Dealer
  include Hand
  attr_accessor :cards

  def initialize
    @cards = []    
  end 
  
  def show_flop
    puts "-----Dealer's Hand-----"
    cards.each do |card|
      if card == cards[0]
      else
        puts card.to_s  
      end
    end
    puts ""
  end   

  def reveal_hand
    puts "-----Dealer's Hand-----"
    cards.each do |card|
      puts card.to_s        
    end
    puts ""
    puts "Dealer has a total of #{total}"
  end

end

class Card
  attr_accessor :value, :suit
	
  def initialize (value, suit)
    @value = value
	  @suit  = suit
  end
	
	def to_s
	  "#{value} of #{suit}"
	end


end

class Blackjack
  attr_accessor :player, :dealer, :deck
  
  DEALER_HITS = 17
  BLACK_J     = 21
  
  def initialize
    @player = Player.new("Player1")
    @deck   = Deck.new
    @dealer = Dealer.new
  end
  
  def set_player_name
    puts "What is your name?"
    player.name = gets.chomp
  end  
  
  def deal_cards
    player.hit(deck.deal_one)
    dealer.hit(deck.deal_one)
    player.hit(deck.deal_one)
    dealer.hit(deck.deal_one)
    
  end
  
  def show_flop
    player.show_flop
    dealer.show_flop  
  end  
  
  def player_turn
    #black_or_bust?
    while !player.busted? 
      puts "would you like to hit or stay? Enter 1 for hit, 2 for stay."
      input = gets.chomp
      if input == '2'
        puts "you have decided to stay"    
        break
      end 
      player.hit(deck.deal_one)
      if player.busted?
        puts "Sorry, it looks like you went bust with the #{player.cards[-1]}"
        play_again?
      end  
      puts ""
      puts "You got the #{player.cards[-1]}"
      puts "This gives you a total of #{player.total}" 
      puts ""   
    end
    
  end  
  
  def dealer_turn
    dealer.reveal_hand
    
    while dealer.total < DEALER_HITS
      puts "Dealer has to hit"
      dealer.hit(deck.deal_one)
      puts "Dealer gets a #{dealer.cards[-1]}"
      puts "this gives them a total of #{dealer.total}"
    end
    
    if dealer.busted?
      puts "Congrats! Dealer is bust!"
      play_again?
    end
  end  
  
  def who_won?
    if player.total > dealer.total
      puts "Yes! You won!"
    elsif dealer.total > player.total  
      puts "Sorry, man. Looks like you lost."
    else  
      puts "A tie! Gross..."
    end
    play_again?
  end  
  
  def play_again?
    puts "Would you like to play again? 1 for 'yes', 2 for 'no'"
    input = gets.chomp
    if input == '2'
      puts 'What evs, peace...'
      exit
    elsif input == '1'
      puts "Starting a new game!"
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      start
    else
      puts "Did not understand response..."
      play_again?
    end         
  end
  
  def start
    set_player_name
    deal_cards
    show_flop
    player_turn
    dealer_turn
    who_won?
    play_again?
  end  

end

blackjack = Blackjack.new
blackjack.start





