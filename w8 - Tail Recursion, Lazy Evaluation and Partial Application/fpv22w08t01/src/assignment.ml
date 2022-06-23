(* Write tail recursive versions of the following functions (without changing their types) *)

let rec fac_old n =
  if n = 0 then 1 
  else n * fac_old (n - 1)

let rec help_fac n acc = 
  if n = 0 then acc
  else help_fac (n-1) (n * acc)

let fac n = help_fac n 1






























 let fac n =
  let rec help acc n = if n = 0 then acc else help (acc * n) (n - 1) in
  help 1 n

let remove a list =
  let rec help acc a list =
    match list with
    | [] -> acc
    | x :: xs -> if x = a then help acc a xs else help (x :: acc) a xs
  in
  List.rev (help [] a list)





let partition pred list =
  let rec help (l1, l2) list =
    match list with
    | [] -> (List.rev l1, List.rev l2)
    | x :: xs ->
        if pred x then help (x :: l1, l2)  xs
        else help (l1, x :: l2) xs
  in
  help ([], []) list 
