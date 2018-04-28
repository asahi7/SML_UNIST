fun digits(x:int) = 
	if x = 0 then []
	else digits(x div 10) @ ((x mod 10) :: []);
