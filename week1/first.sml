fun pow (x:int, y:int) = (* correct only for y >= 0 *)
	if y = 0
	 then 1
	else x * pow(x, y - 1)

val a = 2;
val b = 5;
val c = pow(a, b);
