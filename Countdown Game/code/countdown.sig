signature COUNTDOWN =
sig
  structure T: TREE
  structure E: EXPRESSION

  val partitions: 'a list -> ('a list * 'a list) list
  val cartesian: 'a list * 'b list -> ('a * 'b) list
  val permutations: 'a list -> 'a list list
  val permoPartitions: 'a list -> ('a list * 'a list) list

  val trees: 'a list -> 'a T.tree list
  val permoTrees: 'a list -> 'a T.tree list

  val treeToExp: 'a E.operation -> 'a T.tree -> 'a E.exp
  val treeToExps: 'a E.operation list -> 'a T.tree -> 'a E.exp list

  val mko_countdown: ''a E.operation list -> ''a list * ''a -> bool
  val ordered_countdown: int list * int -> bool
  val mk_countdown : ''a E.operation list -> ''a list * ''a -> bool
  val countdown : int list * int -> bool
end (* signature COUNTDOWN *)
