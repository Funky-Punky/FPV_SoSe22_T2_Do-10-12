type direction = Left | Right | Up | Down
type route = direction list

let rec contains_down route =
  match route with
  | [] -> false
  | Down :: _ -> true
  | _ :: route' -> contains_down route'

(*






*)

type student = {
  first_name : string;
  last_name : string;
  id : int;
  semester : int;
  grades : (int * float) list;
}

type 'a option = None | Some of 'a

let exists x = if x = None then false else true

let rec find_by_id id db =
  match db with
  | [] -> None
  | student :: db' ->
      if student.id = id then Some student else find_by_id id db'

(*





*)

type my_list = Empty | Element of int * my_list

let one_two_five = Element (1, Element (2, Element (5, Empty)))
let insert new_element list = Element (new_element, list)

let rec insert_sorted new_element list =
  match list with
  | Empty -> Element (new_element, Empty)
  | Element (v, list') ->
      if new_element > v then Element (v, insert_sorted new_element list')
      else Element (new_element, list)
