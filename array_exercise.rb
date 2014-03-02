

#does array x contain all elements from array y?
def contain_array?(tester, t_arr)
	holder = []
	tester.each do |x|
		t_arr.each do |y|			
			if x == y 
			holder.push y
			end
		end
	end

	if holder.length == t_arr.length
			print true
		else
			print false
	end
end







