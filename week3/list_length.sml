fun get_length(x : int list) = 
	case x  of
		[] => 0
		| _::xs' => 1 + get_length(xs'); 
