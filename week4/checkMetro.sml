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
