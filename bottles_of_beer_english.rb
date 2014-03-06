def english_number(number)
	if number < 0
		return 'please enter a number greater than 0'
	end
  if number == 0
    return 'zero'  
  end  
  
  num_string = ''
  
  ones  = ['one','two','three','four','five','six','seven','eight','nine']
  tens  = ['ten','twenty','thirty','fourty','fifty','sixty','seventy','eighty','ninety']
  teens = ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
  
  left  = number
  write = left/1000000000000
  left  = left - write*1000000000000
  
  if write > 0
    trillions = english_number(write)
    num_string = num_string + trillions + ' trillion,'
    if left > 0
      num_string = num_string + ' '
    end
  end
  
  write = left/1000000000
  left  = left - write*1000000000
  
  if write > 0
    billions = english_number(write)
    num_string = num_string + billions + ' billion,'
    if left > 0
      num_string = num_string + ' '
    end
  end  
  
  write = left/1000000
  left  = left - write*1000000
  
  if write > 0
    millions = english_number(write)
    num_string = num_string + millions + ' million,'
    if left > 0
      num_string = num_string + ' '
    end
  end
  
  
  write = left/1000
  left  = left - write*1000
  
  if write > 0
    thousands = english_number(write)
    num_string = num_string + thousands + ' thousand,'
    if left > 0
      num_string = num_string + ' '
    end
  end
  
  write = left/100
  left  = left - write*100
  
  if write > 0
    hundreds = english_number(write)
    num_string = num_string + hundreds + ' hundred'
    if left > 0
      num_string = num_string + ' '
    end
  end
  
  write = left/10
  left  = left - write*10
  
  if write > 0
    if ((write == 1) and (left > 0))
      num_string = num_string + teens[left-1]
      left = 0
    else
      num_string = num_string + tens[write-1]  
    end  
    
    if left > 0
      num_string = num_string + '-'
    end
  end
    
    write = left
    left = 0
    
  if write > 0  
    num_string = num_string + ones[write-1]
  end
  
  num_string
end

def beer(num)
  bottles = num
  

  while bottles > 2
    puts english_number(bottles) + " bottles of beer on the wall " + english_number(bottles) + " bottles of beer, take one down, pass it around, " + english_number(bottles-1) + " bottles of beer on the wall."
    bottles = bottles -1
  end
  
  puts "2 bottles of beer on the wall, 2 bottles of beer, take one down, pass it around, 1 bottle of beer on the wall."
  puts "1 bottle of beer on the wall, 1 bottle of beer, take one down, pass it around, were drunk."

end

beer(2367)