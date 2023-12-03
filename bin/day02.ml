open Core

let () =
  let lines = Advent.read_lines "./inputs/day2.txt" in
  let conditions =
    [
      (12, Re.Perl.compile_pat "(\\d+) red");
      (13, Re.Perl.compile_pat "(\\d+) green");
      (14, Re.Perl.compile_pat "(\\d+) blue");
    ]
  in

  let is_valid line (number, condition) =
    let matches = Re.all condition line in
    List.find matches ~f:(fun m ->
        let gmatches = Re.Group.get_opt m 1 in
        match gmatches with
        | Some m when Int.of_string m > number -> true
        | _ -> false)
    |> Option.is_some
  in

  List.foldi lines ~init:0 ~f:(fun idx acc line ->
      let invalid_cond = List.filter conditions ~f:(is_valid line) in
      acc + if List.length invalid_cond = 0 then idx + 1 else 0)
  |> Fmt.pr "@.Part 1: %d@."

let () =
  let lines = Advent.read_lines "./inputs/day2.txt" in
  let searches =
    [
      Re.Perl.compile_pat "(\\d+) red";
      Re.Perl.compile_pat "(\\d+) green";
      Re.Perl.compile_pat "(\\d+) blue";
    ]
  in

  let get_max line cond =
    let matches = Re.all cond line in
    List.fold matches ~init:1 ~f:(fun acc m ->
        match Re.Group.get_opt m 1 with
        | Some num when Int.of_string num > acc -> Int.of_string num
        | _ -> acc)
  in

  List.fold lines ~init:0 ~f:(fun acc line ->
      let maxes = List.map searches ~f:(get_max line) in
      let power = List.fold maxes ~init:1 ~f:( * ) in
      acc + power)
  |> Fmt.pr "@.Part 2: %d@."
