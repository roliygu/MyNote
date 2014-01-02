fun pow (x : int, y : int)=
    if y = 0
    then 1
    else x * pow(x,y-1)

fun cube(x : int)=
	pow(x,3)

val sixtyfou = cube 4

fun swap (pr : int * bool)=
	(#2 pr,#1 pr)

fun sum_two_pairs(pr1 : int * int,pr2 : int * int)=
	(#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2)

fun div_mod(x : int ,y : int)=
	(x div y, x mod y)

fun sort_pair(pr : int * int)=
	if (#1 pr) < (#2 pr)
	then pr 
	else (#2 pr, #1 pr)

fun sum_list(xs : int list) = 
	if null xs
	then 0
	else hd xs + sum_list(tl xs)

fun countdown(x : int ) = 
	if x = 0
	then []
	else x :: countdown(x-1)

fun append(xs : int list, ys : int list)=
	if null xs
	then ys
	else (hd xs) :: append((tl xs), ys)

fun sum_pair_list(xs : (int * int) list)=
	if null xs
	then 0
	else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)

fun firsts (xs : (int * int) list)=
	if null xs 
	then []
	else (#1 (hd xs)) :: firsts(tl xs)

fun silly()=
	let 
		val x = 1
	in	
		(let val x = 2 in x+1 end)(* x is 2*) + (let val y = x+2 in y+1 end)(*x is 1*)
	end