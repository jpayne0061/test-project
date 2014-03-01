



def survey question
  while true
    puts question
    answer = gets.chomp.downcase
    if answer == 'yes'
      return true
		end
    if answer = 'no'
      return false	
		end
    
      puts "please answer yes or no"  
  end
end



puts "Hello, take this survey"

x = survey "Do you like tacos?"

puts x