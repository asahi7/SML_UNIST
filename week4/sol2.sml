datatype expr = NUM of int
 		| PLUS of expr * expr
		| MINUS of expr * expr
datatype formula = TRUE
		| FALSE
 		| NOT of formula
 		| ANDALSO of formula * formula
	 	| ORELSE of formula * formula
 		| IMPLY of formula * formula
 		| LESS of expr * expr

(* eval(ANDALSO(TRUE, LESS(NUM 10, NUM 55))) *)
fun eval(x:formula) =
	case x of
		TRUE => true
		| FALSE => false
		| NOT e => if(eval(e) = false) then true else false
		| ANDALSO(e1, e2) => if eval(e1) = true andalso eval(e2) = true then true else false
		| ORELSE(e1, e2) => if eval(e1) = true orelse eval(e2) = true then true else false
		| IMPLY(e1, e2) => if eval(e1) = true andalso eval(e2) = false then false else true
		| LESS(exp1, exp2) => let fun evalExpr(someExpr: expr) =
									case someExpr of
										NUM num => num
										| PLUS(ex1, ex2) => (evalExpr(ex1)) + (evalExpr(ex2))
										| MINUS(ex1, ex2) => (evalExpr(ex1)) - (evalExpr(ex2))
							  in
									if evalExpr(exp1) < evalExpr(exp2) then true
									else false
							  end

type name = string

datatype metro = STATION of name
 				 | AREA of name * metro
 				 | CONNECT of metro * metro

fun checkMetro(e: metro) =
	let fun recc(ex) = 
		case ex of 
		STATION nm => (nm::[])
		| AREA(nm, e1) => let val res = recc(e1) 
						  in
						  		let fun checkExistence(xs) =
									if (null xs) then []
									else let val res2 = checkExistence(tl xs)
									 	 in
									 		if (hd xs) = nm then res2
											else (hd xs)::res2
									 	 end
						  		in
									checkExistence(res)				
						 		end
						 	end
		| CONNECT(e1, e2) => (recc(e1)) @ (recc(e2))
	in
		let val final = recc(e)
		in
			if (null final) then true
			else false
		end
	end


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
