fun reverse(xs: int list) =
	if null xs then []
	else if null(tl xs) then hd(xs) :: []
	else reverse(tl xs) @ (hd(xs) :: [])
