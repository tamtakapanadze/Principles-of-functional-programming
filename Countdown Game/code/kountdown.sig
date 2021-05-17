signature KOUNTDOWN =
sig
  structure I: ITERATOR
  structure T: TREE
  structure E: EXPRESSION

  val part : 'a list -> (unit -> ('a list * 'a list) I.iterator)
          -> ('a list * 'a list) I.iterator

  val partitions: 'a list -> ('a list * 'a list) I.iterator
  val permutations: 'a list -> 'a list I.iterator
  val permoPartitions: 'a list -> ('a list * 'a list) I.iterator

  val trees: 'a list -> 'a T.tree I.iterator
  val permoTrees: 'a list -> 'a T.tree I.iterator

  val treeToExps: 'a E.operation list -> 'a T.tree -> 'a E.exp I.iterator

  val mko_countdown: ''a E.operation list -> ''a list * ''a -> ''a E.exp I.iterator
  val ordered_countdown: int list * int -> int E.exp I.iterator
  val mk_countdown: ''a E.operation list -> ''a list * ''a -> ''a E.exp I.iterator
  val countdown: int list * int -> int E.exp I.iterator
end (* signature KOUNTDOWN *)
