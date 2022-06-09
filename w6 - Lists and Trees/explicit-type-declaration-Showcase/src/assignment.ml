type vector3 = float * float * float

let p1 = (0., 1., 2.)
let p2 = (-10., -20., -30.)
let p3 = (123.456, 654.321, 0.00001)

let string_of_vector3 (x, y, z) =
  "(" ^ string_of_float x ^ "," ^ string_of_float y ^ "," ^ string_of_float z
  ^ ")"

let vector3_add a b =
  let (a, b, c), (x, y, z) = (a, b) in
  (a +. x, b + y, c +. z)

let vector3_max v1 v2 =
  match (v1, v2) with
  | (a, b, c), (x, y, z) ->
      if (a *. a) +. (b *. b) +. (c *. c) > (x *. x) +. (y *. y) +. (z *. z)
      then (a, b, c)
      else (x, y, z)

let combine a b c = string_of_vector3 (vector3_add a (vector3_max b c))

(*


   ===============================================================================
*)
type student = {
  first_name : string;
  last_name : string;
  id : int;
  semester : int;
  grades : (int * float) list;
}

type database = student list

let insert s db = s :: db

let rec find_by_id id db =
  match db with
  | [] -> []
  | student :: db' -> if student.id = id then [ student ] else find_by_id id db'

let rec find_by_last_name name db : database =
  match db with
  | [] -> []
  | student :: db' ->
      if student.last_name = name then  student  :: find_by_last_name name db'
      else find_by_last_name name db'
