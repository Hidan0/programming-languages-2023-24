(*
Put into a list, called alkaline_earth_metals, the atomic numbers of the six alkaline earth metals: beryllium (4), magnesium (12), calcium (20), strontium (38), barium (56), and radium (88). Then

Write a function that returns the highest atomic number in alkaline_earth_metals.
Write a function that sorts alkaline_earth_metals in ascending order (from the lightest to the heaviest).
Put into a second list, called noble_gases, the noble gases: helium (2), neon (10), argon (18), krypton (36), xenon (54), and radon (86). Then

Write a function (or a group of functions) that merges the two lists and print the result as couples (name, atomic number) sorted in ascending order on the element names.
*)

type element = { name : string; weight : int }

let alkaline_earth_metals : element list =
  [
    { name = "beryllium"; weight = 4 };
    { name = "magnesium"; weight = 12 };
    { name = "calcium"; weight = 20 };
    { name = "strontium"; weight = 38 };
    { name = "barium"; weight = 56 };
    { name = "radium"; weight = 88 };
  ]

let heaviest (metals : element list) : element =
  List.fold_left
    (fun old current -> if current.weight > old.weight then current else old)
    { name = ""; weight = -1 } metals

let sort_by_weight (metals : element list) : element list =
  List.sort (fun m1 m2 -> compare m1.weight m2.weight) metals

let () =
  let result = heaviest alkaline_earth_metals in
  Printf.printf "The metal with the highest weight number is %s (with %d)\n"
    result.name result.weight

let () =
  let sorted = sort_by_weight alkaline_earth_metals in
  List.iter (fun itm -> Printf.printf "%s: %d\n" itm.name itm.weight) sorted

let noble_gasses : element list =
  [
    { name = "helium"; weight = 2 };
    { name = "neon"; weight = 10 };
    { name = "argon"; weight = 18 };
    { name = "krypton"; weight = 36 };
    { name = "xenon"; weight = 54 };
    { name = "radon"; weight = 86 };
  ]

let sort_by_name list = List.sort (fun m1 m2 -> compare m1.name m2.name) list

let merge_element_lists (elements1 : element list) (elements2 : element list) =
  List.fold_right (fun itm acc -> itm :: acc) elements1 elements2

let print_merged_elements elements1 elements2 =
  let sorted = sort_by_name (merge_element_lists elements1 elements2) in
  List.iter (fun itm -> Printf.printf "(%s, %d)\n" itm.name itm.weight) sorted

let () = print_merged_elements alkaline_earth_metals noble_gasses
