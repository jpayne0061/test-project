
table1 = ["Table of contents", ]
chaps = [["Getting Started", 1], 
         ["Numbers",         9],
         ["Letters",         13]
						]

puts table1[0].center(50)
puts ""

chap_num = 1

chaps.each do |x|
  chap_name = x[0]
  chap_page =  x[1]
  
  beg = "Chapter " + chap_num.to_s + ":  " + chap_name
  endi = "page " + chap_page.to_s
  chap_num += 1
  puts beg.ljust(50) + endi.rjust(10)

end
