puts "Hi there peaches!"
num = 3

while num > 1
  say = gets.chomp
  if say == "BYE" 
    num = num -1
	say = gets.chomp
  elsif say == say.upcase
    puts "'NO, NOT SINCE '" + (rand(21) + 1930).to_s + "!"
  else	
	puts "HUH! SPEAK UP!, SONNY!"
  end  
end