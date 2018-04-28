fun apply_f(f:int*int -> int, x:int, y:int) = f(x,y)

fun ret_f(f:int*int -> int): int*int->int = f

fun plus(x:int, y:int) = x+y

val ans1 = apply_f(plus, 15, 10)
val ans2 = ret_f(plus) (10, 12)





