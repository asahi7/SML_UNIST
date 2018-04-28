fun digitalRoot(x:int) = 
let 
	fun sumDigits(x:int) = 
		if x = 0 then 0
		else sumDigits(x div 10) + (x mod 10) 
in
	if (x div 10 = 0) then x
	else digitalRoot(sumDigits(x))
end

fun additivePersistence(x:int) =
let 
	fun sumDigits(x:int) = 
		if x = 0 then 0
		else sumDigits(x div 10) + (x mod 10) 	
	fun iterator(x:int, it:int) = 
		if (x div 10 = 0) then it
		else iterator(sumDigits(x), it + 1)
in
	iterator(x, 0)
end
