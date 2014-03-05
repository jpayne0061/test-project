def dic_sort (sorted, unsorted)    
  
  if unsorted.length == 0
    return sorted
  end
  
  smallest = unsorted.pop
  still_unsorted = []
  
  unsorted.each do |x|
    if smallest.downcase < x.downcase
      still_unsorted << x
    else
      still_unsorted << smallest
      smallest = x
    end  
  end
  
  sorted << smallest
  
  dic_sort(sorted, still_unsorted) 
  
end  

puts dic_sort([], ['B', 'd', 'Z', 'a', 'c'])
