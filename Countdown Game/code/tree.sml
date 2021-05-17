structure Tree: TREE =
struct

  datatype 'a tree = Leaf of 'a
  		   | Node of 'a tree * 'a tree

  (* reduce f g t ==> v
     ENSURES: v is the value obtained by applying f to the leaves of t
              and recursively combining the result of the subtrees of
              inner nodes with g
   *)
  fun reduce (f: 'a -> 'b) (g: 'b * 'b -> 'b) (Leaf x: 'a tree): 'b = f x
    | reduce f g (Node(tL,tR)) = g (reduce f g tL, reduce f g tR)

  (* toString ts t ==> s
     ENSURES: s is a string representation of tree t using
              ts to print elements
   *)
  fun toString (ts: 'a -> string) =
    reduce (fn x => "Leaf " ^ ts x)
	   (fn (l,r) => "Node (" ^ l ^ ", " ^ r ^ ")")

  (* eq a_eq (e1,e2) ==> b
     ENSURE: b == true iff t1 and t2 are isomorphic trees,
             with the same values at the leaves
   *)
  fun eq (a_eq: 'a * 'a -> bool) (Leaf x1: 'a tree, Leaf x2: 'a tree): bool =
       a_eq (x1,x2)
    | eq a_eq (Node (t1L,t1R), Node (t2L,t2R)) =
       eq a_eq (t1L,t2L) andalso eq a_eq (t1R,t2R)
    | eq _ _ = false

  (* inorder t ==> l
     ENSURES: l is the inorder traversal of t
   *)
  fun inorder (Leaf x: 'a tree): 'a list = [x]
    | inorder (Node (tL,tR)) = (inorder tL) @ (inorder tR)

end (* structure Tree *)
