fun full_name(r : {name:string,surname:string,fathers_name:string}) =
	let val {name=x,surname=y,fathers_name=z} = r
	in
		x ^ " " ^ y ^ " " ^ z
	end
