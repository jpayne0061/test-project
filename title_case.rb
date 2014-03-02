

#this method take a string of words and put them into Title Case. The second parameter provides execptions(words that shouldn't be capitalized) For example: title_case("of mice and men", "and") => "Of Mice and Men" 

def title_case(title, minor_words='')

  c = title.split(" ")
  d = minor_words.downcase.split(" ")
 
  c.each do |x|
    x.capitalize!
    unless x == c[0]
      if d.include?(x.downcase)
        x.downcase!
      end	
    end  
  end
  return c.join(" ") 
end







