def ask(question) 
  puts question
  reply = gets.chomp
  while true
    if reply == 'yes'
      answer = true
      break
    elsif reply == 'no'  
      answer = false
      break
    else
      puts "please respond 'yes' or 'no'"  
    end  
  end  
  answer
end

ask("Do you like poptarts?")
ask("Do you eat tacos?")

wets_bed = ask("Do you wet the bed?")

puts wets_bed