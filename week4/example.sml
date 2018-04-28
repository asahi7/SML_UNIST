datatype 'a lazyList = nullList
 					   | cons of 'a * (unit -> 'a lazyList)

datatype set = S of {insert : int -> set, 
					 member: int -> bool,
					 size: unit -> int
					}
