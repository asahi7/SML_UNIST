datatype 'a lazyList = nullList
 					   | cons of 'a * (unit -> 'a lazyList) 

fun go(xs: lazyList) =
	let fun f(unit) = 
		
	in
		case lazyList of
			nullList => nullList
			| cons(x, g) => 
	end

