structure Expression : EXPRESSION =
struct
  type 'a operation = string * ('a * 'a -> 'a)
  datatype 'a exp = Val of 'a
  		  | Op of 'a operation * 'a exp * 'a exp

  (* toString ts e ==> s
     ENSURES: s is a string representation of expression e
              usingxs ts to print elements
   *)
  fun toString (ts: 'a -> string) (Val x) = ts x
    | toString ts (Op ((s,_),tL,tR)) =
        "(" ^ toString ts tL ^ " " ^ s ^ " " ^ toString ts tR ^ ")"

  (* eq a_eq (e1,e2) ==> b
     ENSURE: b == true iff e1 and e2 are the same expression,
             by operator name and value
   *)
  fun eq (a_eq: 'a * 'a -> bool) (Val x1: 'a exp, Val x2: 'a exp): bool =
       a_eq (x1,x2)
    | eq a_eq (Op ((s1,_), e1L, e1R), Op ((s2,_), e2L, e2R)) =
       s1=s2 andalso eq a_eq (e1L,e2L) andalso eq a_eq (e1R,e2R)
    | eq _ _ = false

  (* eval e => v
     ENSURES: v is the value obtained applying the operations at each
              node to the result of evaluating the subtrees
   *)
  fun eval (Val x: 'a exp): 'a = x
    | eval (Op ((_,f),L,R)) = f (eval L, eval R)

end (* structure Exp *)
