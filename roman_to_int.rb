
#does string contain? cm, cd, xc, xl, iv, ix

#if so, pull those out into a separate array
#assign values to all: I, V, X, L, C, D, M: IV, IX, XL, XC, CD, CM, 
#split both arrays into separate strings/letters

#if array[x] ==  I
#array[x] = 5
#end

#add up the arrays


def roman_to_int(rom)
  rom.upcase
  mod_array = []
  
  if rom.include? "IV"
    rom.slice!"IV"
    mod_array << 4
  end
  if rom.include? "IX"
    rom.slice!"IX"
    mod_array << 9
  end
  if rom.include? "XL"
    rom.slice!"XL"
    mod_array << 40
  end
  if rom.include? "XC"
    rom.slice!"XC"
    mod_array << 90
  end
  if rom.include? "CD"
    rom.slice!"CD"
    mod_array << 400
  end
  if rom.include? "CM"
    rom.slice!"CM"
    mod_array << 900
  end
  if rom.include? "I"
    rom.slice!"I"
    mod_array << 1
  end
  if rom.include? "V"
    rom.slice!"V"
    mod_array << 5
  end
  if rom.include? "X"
    rom.slice!"X"
    mod_array << 10
  end
  if rom.include? "L"
    rom.slice!"L"
    mod_array << 50
  end
  if rom.include? "C"
    rom.slice!"C"
    mod_array << 100
  end
  if rom.include? "D"
    rom.slice!"D"
    mod_array << 500
  end
  if rom.include? "M"
    rom.slice!"M"
    mod_array << 1000
  end 
  
  mod_array.inject(:+)
   
end



