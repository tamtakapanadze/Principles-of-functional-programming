functor Countdown (structure Tree : TREE
                   structure Exp  : EXPRESSION) : COUNTDOWN =
struct
structure T = Tree
structure E = Exp

  fun partitions      _ = raise Fail "Unimplemented"
  fun cartesian       _ = raise Fail "Unimplemented"
  fun permutations    _ = raise Fail "Unimplemented"
  fun permoPartitions _ = raise Fail "Unimplemented"

  fun trees      _ = raise Fail "Unimplemented"
  fun permoTrees _ = raise Fail "Unimplemented"

  fun treeToExp  _ = raise Fail "Unimplemented"
  fun treeToExps _ = raise Fail "Unimplemented"

  fun mko_countdown     _ = raise Fail "Unimplemented"
  fun ordered_countdown _ = raise Fail "Unimplemented"
  fun mk_countdown      _ = raise Fail "Unimplemented"
  fun countdown         _ = raise Fail "Unimplemented"

end (* functor Countdown *)
