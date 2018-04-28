fun isSorted(a : int list) =
	case a of 
		[] => true
		| _::[] => true
		| head::(next::tail) => head <= next andalso isSorted(tail)

