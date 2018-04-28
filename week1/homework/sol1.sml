(* As an input we take two sorted lists and as an output we return one combined sorted list *) 
fun merge(xs: int list, ys: int list) = 
	if null(ys) andalso null(xs) then []
	else if null(ys) then hd(xs) :: merge(tl xs, ys)
	else if null(xs) then hd(ys) :: merge(xs, tl ys)
	else if hd(xs) < hd(ys) then hd(xs) :: merge(tl xs, ys)
	else hd(ys) :: merge(xs, tl ys)
 
