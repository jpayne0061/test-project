puts "please enter a starting year"
start = gets.chomp
puts "please enter an ending year"
stop = gets.chomp

while start.to_i > stop.to_i
  start = start.to_i - 1
  if start % 400 == 0
    puts start.to_i
  elsif start % 100 == 0
  elsif start % 4 == 0
    puts start.to_i      
  end  

end