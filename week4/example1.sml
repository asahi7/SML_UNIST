datatype 'a lazyList = nullList
 					   | cons of 'a * (unit -> 'a lazyList)

val a = cons(7, fn() => cons(6, fn() => cons(5, fn() => nullList)))

fun go(xs: int lazyList) = 
	case xs of 
		nullList => []
		| cons(y, fys) => let val ys = fys() in y::go(ys) end

val b = go(a)
