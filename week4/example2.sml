datatype 'a lazyList = nullList
 					   | cons of 'a * (unit -> 'a lazyList)

val a = cons(7, fn() => cons(6, fn() => cons(5, fn() => nullList)))

fun go(xs: int lazyList) = 
	case xs of 
		nullList => []
		| cons(y, fys) => let val ys = fys() in y::go(ys) end

fun seq(first: int, second: int) = 
	if first = second then cons(first, fn() => nullList)
	else cons(first, fn() => seq(first + 1, second))

fun infSeq(first: int) = 
	let 
		fun generateNext(nextNumber: int) =
			(* if nextNumber = 10 then cons(nextNumber, fn() => nullList) *)
			cons(nextNumber, fn() => generateNext(nextNumber + 1))
	in
		cons(first, fn() => generateNext(first + 1)) 
	end

fun firstN(lazyListVal, n: int) = 
	if n = 0 then []
	else case lazyListVal of 
			 nullList => []
			 | cons(y, fys) => let val ys = fys() in y::firstN(ys, n - 1) end

fun Nth(lazyListVal, n: int) = 
	case lazyListVal of 
		nullList => NONE
		| cons(y, fys) => let val ys = fys() 
						  in 
						  	if n = 1 then SOME(y)
						  	else Nth(ys, n - 1) 
						  end

fun filterMultiples(lazyListVal, n: int) = 
	case lazyListVal of 
		nullList => nullList
		| cons(y, fys) => let val ys = fys()
						  in
							if y mod n = 0 then filterMultiples(ys, n)
							else cons(y, fn() => filterMultiples(ys, n))
						  end

fun sieve(lazyListVal) = 
	let val cons(first, _) = lazyListVal
	in
		filterMultiples(lazyListVal, first)
	end

fun primes() = 
	let
		fun generatePrimes(lazyListVal) = 
			let val newList = sieve(lazyListVal)
				val cons(first, _) = lazyListVal
			in
				cons(first, fn() => generatePrimes(newList))
			end
	in
		generatePrimes(infSeq(2))
	end
