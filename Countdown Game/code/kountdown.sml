functor Kountdown (structure Iterator : ITERATOR
                   structure Tree : TREE
                   structure Exp : EXPRESSION) : KOUNTDOWN =
struct
structure I = Iterator
structure T = Tree
structure E = Exp

  fun part            _ = raise Fail "Unimplemented"
  fun partitions      _ = raise Fail "Unimplemented"
  fun permutations    _ = raise Fail "Unimplemented"
  fun permoPartitions _ = raise Fail "Unimplemented"

  fun trees      _ = raise Fail "Unimplemented"
  fun permoTrees _ = raise Fail "Unimplemented"

  fun treeToExps _ = raise Fail "Unimplemented"

  fun mko_countdown     _ = raise Fail "Unimplemented"
  fun ordered_countdown _ = raise Fail "Unimplemented"
  fun mk_countdown      _ = raise Fail "Unimplemented"
  fun countdown         _ = raise Fail "Unimplemented"

end (* functor Kountdown *)
