type vector3 = float * float * float

val p1 : vector3
val p2 : vector3
val p3 : vector3
val string_of_vector3 : vector3 -> string
val vector3_add : vector3 -> vector3 -> vector3
val vector3_max : vector3 -> vector3 -> vector3
val combine : vector3 -> vector3 -> vector3 -> string

(*



   ================================================================
*)

type student = {
  first_name : string;
  last_name : string;
  id : int;
  semester : int;
  grades : (int * float) list;
}

type database = student list

val insert : student -> database -> database
val find_by_id : int -> database -> student list
val find_by_last_name : string -> database -> student list