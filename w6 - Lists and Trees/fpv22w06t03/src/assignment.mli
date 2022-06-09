(* abstract type: define as you wish *)
type tree = Node of (int * tree * tree) | Empty

val node : int -> tree -> tree -> tree
val leaf : unit -> tree
val inspect : tree -> (int * tree * tree) option
val t1 : tree
val to_list : tree -> int list
val insert : int -> tree -> tree
val contains : int -> tree -> bool
val remove : int -> tree -> tree
val remove_fast : int -> tree -> tree
val remove_intuitive : int -> tree -> tree
