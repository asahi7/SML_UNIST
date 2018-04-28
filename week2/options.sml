fun maximum(a:int list) = 
	if null(a) then NONE
	else 
		let val max_ans = maximum(tl a)
		in
			if isSome(max_ans) = true andalso valOf(max_ans) > hd(a) then max_ans
			else SOME (hd(a))
		end
