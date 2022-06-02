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

let rec find_by_last_name name db =
  match db with
  | [] -> []
  | student :: db' ->
      if student.last_name = name then student :: find_by_last_name name db'
      else find_by_last_name name db'

let student_jonas =
  {
    first_name = "Jonas";
    last_name = "Reinstaedtler";
    id = 03742644;
    semester = 4;
    grades = [ (1, 2.3); (2, 5.0); (3, 1.2) ];
  }

let student_max =
  {
    first_name = "Max";
    last_name = "Musterman";
    id = 123456789;
    semester = 3;
    grades = [ (1, 3.0); (2, 2.0); (3, 3.7) ];
  }

let student_frida =
  {
    first_name = "Frida";
    last_name = "Musterman";
    id = 111111111;
    semester = 3;
    grades = [ (1, 3.0); (2, 2.0); (3, 3.7) ];
  }

let miniTum = [ student_jonas; student_max; student_frida ]
