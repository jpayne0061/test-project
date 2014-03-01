
favs = []
puts "please enter some words"
while true
  word = gets.chomp
  "enter another one or hit 'enter' without typing anything to stop"
  if word == ''
    break
  end
  favs.push word
end


