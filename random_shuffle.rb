
def shuffle a
  b = []
  z = a.length
	while z > 0	  
	  x = a[rand(a.length)]
		b.push x
		a.delete(x)
		z = z -1
  end
	print b
end











