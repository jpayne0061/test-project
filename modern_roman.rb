def modern_roman(num)
  thous = (num / 1000)
  hun   = (num % 1000 / 100)
  ten   = (num % 100  /  10)
  one   = (num % 10   /   1)
  
  rom = 'M' * thous
  
  if hun == 9
    rom = rom + 'CM'  
  elsif hun == 4  
    rom = rom + 'CD'
  else
    rom = rom + 'D' * (num % 1000 / 500)  
    rom = rom + 'C' * (num % 500  / 100)
  end  
  
  if ten == 9
    rom = rom + 'XC'
  elsif ten == 4
    rom = rom + 'XL'
  else  
    rom = rom + 'L' * (num % 100 / 50)
    rom = rom + 'X' * (num % 50  / 10)
  end
  
  if one == 9
    rom = rom + 'IX'
  elsif one == 4
    rom = rom + 'IV'
  else  
    rom = rom + 'V' * (num % 10 / 5)
    rom = rom + 'I' * (num % 5  / 1)
  end
  rom
end  


