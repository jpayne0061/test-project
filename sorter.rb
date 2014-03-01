
def a d
  evan d, []
end

def sorter a, b
  if a.length <= 0
    return b
	
  end	
  
    smallest = a.pop
    c = []
  
	a.each do |x|
      if x < smallest
	    c.push smallest
		smallest = x
	  else
        c.push x
      end		
    end 
  
  b.push smallest
  evan c, b
  
end

puts (a(['2', '3', '1', '7', '4']))


















