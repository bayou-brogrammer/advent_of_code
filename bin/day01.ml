open Core

(* Part 1 *)
let () =
  let lines = Advent.read_lines "./inputs/day1.txt" in
  List.fold lines ~init:0 ~f:(fun acc line ->
      let chars = String.to_list line in
      let numbers = List.filter chars ~f:Char.is_digit in
      let number =
        Fmt.str "%c%c" (List.hd_exn numbers) (List.last_exn numbers)
      in
      let num = Int.of_string number in
      acc + num)
  |> Fmt.pr "@Part 1 Result: %d@."

(* Part Dos *)
let cases =
  [
    ("one", "1");
    ("two", "2");
    ("three", "3");
    ("four", "4");
    ("five", "5");
    ("six", "6");
    ("seven", "7");
    ("eight", "8");
    ("nine", "9");
    ("1", "1");
    ("2", "2");
    ("3", "3");
    ("4", "4");
    ("5", "5");
    ("6", "6");
    ("7", "7");
    ("8", "8");
    ("9", "9");
  ]

let to_digit str pos =
  List.find_map cases ~f:(fun (substr, digit) ->
      match String.substr_index ~pos str ~pattern:substr with
      | Some matched when matched = pos -> Some digit
      | _ -> None)

let str_to_numbers str =
  let map_to_number = to_digit str in
  List.range 0 (String.length str) |> List.filter_map ~f:map_to_number

let () =
  let lines = Advent.read_lines "./inputs/day1.txt" in
  List.fold lines ~init:0 ~f:(fun acc line ->
      let numbers = str_to_numbers line in
      let number =
        Fmt.str "%s%s" (List.hd_exn numbers) (List.last_exn numbers)
      in
      print_endline number;
      let number = Int.of_string number in
      acc + number)
  |> Fmt.pr "@Part 2 Result: %d@."
