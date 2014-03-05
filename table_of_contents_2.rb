
title = "Table of Contents"

chapters = [["Getting Started",  1],
						["Page Numbers",    12],
						["Other Stuff",     13],			
											            ]
chap_num = 1																	
chapters.each do |x|
  name = x[0]  			
	page = x[1]

  start = "Chapter " + chap_num.to_s + " " + "#{name}" 
  stop  = page.to_s

  puts start.ljust(30) + stop.rjust(30)
  
  chap_num = chap_num + 1

end


