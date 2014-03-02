
class OrangeTree

  def initialize name 
    @name = name
	@age = 0
	@alive = true
	@height = 0
	@fruit = 0
	puts "You planted an orange tree and named him #{@name}!"
	while @alive == true
	  puts "What would you like to do? pass time, pick an orange, count the oranges or measure height?"
	  answer = gets.chomp
	  if answer == 'pass time'
	    one_year_passes
	  elsif answer == 'pick an orange'  
	    pick_an_orange
	  elsif answer == 'count the oranges'
        count_the_oranges
	  elsif answer == 'measure height'
        height
      end
    end	  
  end
  
  
  
  def height
    puts "#{@name} is #{@height} ft tall now!"
  end
  
  def one_year_passes
    @age = @age + 1
	@height = @height + 2
	@fruit = 0
	if @age >= 5
	  puts "#{@name} is old enough to make fruit now!"
	  @fruit = @fruit + 10
	elsif @age >= 10  
	  puts "#{@name} is making more fruit now!"
	  @fruit = @fruit +15
	end
	if @age >= 13
	  @alive = false
	  puts "Sorry, #{@name} has died"
	  exit
	end
	height
  end
  
  def count_the_oranges
    if @fruit <= 0
	  puts "It looks like #{@name} doesn't have any oranges left, darn"
    elsif @fruit == 1
	  puts "There is 1 orange on #{@name}"
    else
	  puts "There are #{@fruit} oranges on #{@name}"
    end	
  end
  
  def pick_an_orange
    if @fruit <= 0
	  puts "There are no more oranges to pick!"
	end
	@fruit = @fruit - 1
	puts "That was a fantastic orange!"
  end
end

tree = OrangeTree.new "Terrance"









