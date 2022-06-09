let hd l = match l with [] -> failwith "invalid" | x :: _ -> x
let tl l = match l with [] -> failwith "invalid" | _ :: l' -> l'
let rec length l = match l with _ :: xr -> 1 + length xr | [] -> 0
let rec append l1 l2 = match l1 with [] -> l2 | x :: xr -> x :: append xr l2
let rev l =
  let rec help l acc =
    match l with [] -> acc | x :: xr -> help xr (x :: acc)
  in
  help l []


  let rec nth l i =
    match l with
    | [] -> failwith "invalid"
    | x :: xr -> if i = 0 then x else nth xr (i - 1)


(* let hd l = match l with x :: _ -> x | _ -> failwith "invalid"
   let tl l = match l with [] -> failwith "invalid" | _ :: l' -> l'
   let rec length l = match l with _ :: xr -> 1 + length xr | _ -> 0
   let rec append l1 l2 = match l1 with [] -> l2 | x :: xr -> x :: append xr l2

   let rev l =
     let rec help l acc =
       match l with [] -> acc | x :: xr -> help xr (x :: acc)
     in
     help l []

   let rec nth l i =
     match l with
     | [] -> failwith "invalid"
     | x :: xr -> if i = 0 then x else nth xr (i - 1) *)
