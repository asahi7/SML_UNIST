datatype arithmetics = Constant of int
					   | Add of arithmetics * arithmetics
					   | Negate of arithmetics

fun eval e = 		
			  case e of
				Constant i => i
			  | Add(x,y) => (eval x) + (eval y)
			  | Negate(x) => ~ (eval x)
	
			   
