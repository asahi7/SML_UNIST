fun maximum(x:int) = fn y => fn z => if z >= x andalso z >= y then z 
									 else if y >= z andalso y >= x then y
									 else x
