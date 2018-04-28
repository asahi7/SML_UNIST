val x = ref 42
val y = ref 42
val z = x
val _ = z := 45
val w = (!x) + (!y)
