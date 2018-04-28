fun fib(n: int) =
	case n of
		1 => (1, 1) 
		| n => (let val (n_1, n_2) = fib(n - 1) in (n_1 + n_2, n_1) end)
			
