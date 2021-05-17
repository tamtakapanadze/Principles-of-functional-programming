signature TREE =
sig
  datatype 'a tree = Leaf of 'a
  		   | Node of 'a tree * 'a tree

  val toString: ('a -> string) -> 'a tree -> string
  val eq: ('a * 'a -> bool) -> 'a tree * 'a tree -> bool
  val reduce: ('a -> 'b) -> ('b * 'b -> 'b) -> 'a tree -> 'b
  val inorder: 'a tree -> 'a list
end (* signature TREE *)
