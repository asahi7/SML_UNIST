fun sigma(a:int, b:int, f:(int->int)) = 
	if a > b then 0
	else sigma(a + 1, b, f) + f(a);
