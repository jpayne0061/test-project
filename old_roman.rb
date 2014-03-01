
def old_roman num
  if num >= 1000
    if num % 1000 == 0
	  puts "M"*(num/1000)
    end
	if num % 1000 >= 500
	  if num % 500 == 0
	    puts "M"*(num/1000) + "D" 
	  elsif num % 100 == 0
        puts "M"*(num/1000) + "D" + "C"*((num%500)/100)
      elsif num % 50 == 0
        puts "M"*(num/1000) + "D" + "C"*((num%500)/100) + "L"*((num%100)/50)
      elsif num % 10 == 0
        puts "M"*(num/1000) + "D" + "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) 
      elsif num % 5 == 0
        puts "M"*(num/1000) + "D" + "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) + "V"*((num%10)/5)
      else
        puts "M"*(num/1000) + "D" + "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) + "V"*((num%10)/5) + "I"*((num%5)/1)	  
	  end
	end
	if num % 1000 < 500
	  if num % 100 == 0
        puts "M"*(num/1000) + "C"*((num%500)/100)
      elsif num % 50 == 0
        puts "M"*(num/1000) + "C"*((num%500)/100) + "L"*((num%100)/50)
      elsif num % 10 == 0
        puts "M"*(num/1000) + "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) 
      elsif num % 5 == 0
        puts "M"*(num/1000) + "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) + "V"*((num%10)/5)
      else
        puts "M"*(num/1000) + "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) + "V"*((num%10)/5) + "I"*((num%5)/1)	  
	  end
	
	end
  end
  if num < 1000
    if num % 500 == 0
	  puts "D"
    end
	if num > 500
	   if num % 100 == 0
        "D" + "C"*((num%500)/100)
      elsif num % 50 == 0
        "D" + "C"*((num%500)/100) + "L"*((num%100)/50)
      elsif num % 10 == 0
        "D" + "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) 
      elsif num % 5 == 0
        "D" + "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) + "V"*((num%10)/5)
      else
        "D" + "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) + "V"*((num%10)/5) + "I"*((num%5)/1)
      end		
	end
	if num < 500
	  if num % 100 == 0
        "C"*((num%500)/100)
      elsif num % 50 == 0
        "C"*((num%500)/100) + "L"*((num%100)/50)
      elsif num % 10 == 0
        "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) 
      elsif num % 5 == 0
        "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) + "V"*((num%10)/5)
      else
        "C"*((num%500)/100) + "L"*((num%100)/50) + "X"*((num%50)/10) + "V"*((num%10)/5) + "I"*((num%5)/1)
      end
	end
  end
end

puts old_roman 1487
