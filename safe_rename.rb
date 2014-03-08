
Dir.chdir '/Users/evanpayne/Desktop/test_programs'
ruby_files = Dir.glob("/Users/evanpayne/Documents/doc_programs/**/*.rb")

puts 'what do want to name your files?'
new_file_name = gets.chomp
 
puts ''
print "Downloading #{ruby_files.length} files" 

pic_num = 1

ruby_files.each do |x|
  new_name = "#{new_file_name}#{pic_num}.rb"
  if File.exist?(new_name)
    exit
  end  
  File.rename x, new_name
  pic_num = pic_num + 1
end


