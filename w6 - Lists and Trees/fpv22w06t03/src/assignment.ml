type tree = Node of (int * tree * tree) | Empty

let leaf _  = Empty
let node x l r = Node (x, l, r)

let inspect node =
  match node with Empty -> None | Node (v, l, r) -> Some (v, l, r)

let t1 =
  Node
    ( 8,
      Node (1, Empty, Node (6, Empty, Empty)),
      Node (12, Node (9, Empty, Empty), Node (42, Empty, Empty)) )

let rec to_list tree =
  match tree with Empty -> [] | Node (v, l, r) -> to_list l @ (v :: to_list r)

let rec contains value tree =
  match tree with
  | Empty -> false
  | Node (v, l, r) ->
      if v = value then true
      else if value < v then contains value l
      else contains value r

let rec insert value tree =
  match tree with
  | Empty -> Node (value, Empty, Empty)
  | Node (v, l, r) ->
      if v = value then tree
      else if value < v then Node (v, insert value l, r)
      else Node (v, l, insert value r)

let rec get_max tree =
  match tree with
  | Empty -> failwith "no Maximum Element in empty tree"
  | Node (v, _, r) -> if r = Empty then v else get_max r

let rec remove_intuitive value tree =
  match tree with
  | Empty -> tree
  | Node (v, l, r) ->
      if value < v then Node (v, remove_intuitive value l, r)
      else if value > v then Node (v, l, remove_intuitive value r)
      else if l = Empty then r
      else if r = Empty then l
      else
        let m = get_max l in
        Node (m, remove_intuitive m l, r)

let rec remove_and_get_max tree =
  match tree with
  | Empty -> failwith "no Maximum Element in empty tree"
  | Node (v, l, r) ->
      if r = Empty then (l, v)
      else
        let r', m = remove_and_get_max r in
        (Node (v, l, r'), m)

let rec remove_fast value tree =
  match tree with
  | Empty -> tree
  | Node (v, l, r) ->
      if value < v then Node (v, remove_fast value l, r)
      else if value > v then Node (v, l, remove_fast value r)
      else if l = Empty then r
      else if r = Empty then l
      else
        let l', m = remove_and_get_max l in
        Node (m, l', r)

let remove = remove_intuitive
