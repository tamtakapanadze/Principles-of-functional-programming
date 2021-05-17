structure Iterator : ITERATOR =
struct

  (* Return the first entry in a search, and a function
     that when called returns the next entry.
   *)
  datatype 'a iterator = NoMore
                       | Next of 'a * (unit -> 'a iterator)

  (* fromList l ==> it
     ENSURES: it is the iterator whose values are the
              elements of l
   *)
  fun fromList ([]: 'a list): 'a iterator = NoMore
    | fromList (x::l) = Next (x, fn () => fromList l)

  (* toList it ==> l
     ENSURES: l is the list of all the elements in it
   *)
  fun toList (NoMore: 'a iterator): 'a list = []
    | toList (Next (x,h)) = x :: toList (h ())

  (* any it ==> x?
     ENSURES: x? == SOME x where x is the first element in it
              x? == NONE if it has no element
   *)
  fun any (NoMore: 'a iterator): 'a option = NONE
    | any (Next (x,_)) = SOME x

  (* all it ==> l
     ENSURES: l is the list of all elements in it
   *)
  val all = toList

  (* some p it ==> x?
     ENSURES: x? == SOME x where x is the first element in it
              satisfying p
              x? == NONE if no such element exists
  *)
  fun some (p: 'a -> bool) (NoMore: 'a iterator): 'a option = NONE
    | some p (Next(x,h)) = 
       if p x
         then SOME x
         else some p (h ())

  (* map f it => it'
     ENSURES: it' results from applying f to every element in it
   *)
  fun map (f: 'a -> 'b) (NoMore: 'a iterator): 'b iterator = NoMore
    | map f (Next(x,h)) = Next (f x, fn () => map f (h ()))

  (* filter p it => it'
     ENSURES: it' is it without the elements that do not satisfy p
   *)
  fun filter (p: 'a -> bool) (NoMore: 'a iterator): 'a iterator = NoMore
    | filter p (Next (x,h)) =
       if p x
  	then Next (x, fn () => filter p (h ()))
          else filter p (h ())

  (* concat IT ==> it
     ENSURES: it is the concatenation of the iterators in IT
   *)
  fun concat (NoMore: 'a iterator iterator): 'a iterator = NoMore
    | concat (Next (NoMore,       h1)) = concat (h1 ())
    | concat (Next (Next (x, h2), h1)) = Next (x, fn () => concat (Next (h2 (), h1)))

  (* cartesian (l1,l2) ==> L
     ENDURES: L is the list of pairs (x1,x2) such that x1 in l1
              and x2 in l2.
   *)
  fun cartesian (l1: 'a iterator, l2: 'b iterator): ('a * 'b) iterator =
    concat (map (fn x1: 'a => map (fn x2: 'b => (x1,x2)) l2) l1)

  (* toString ts it ==> s
     ENSURES: s is a string representation of iterator it using
              ts to print elements
   *)
  fun toString (ts: 'a -> string) (NoMore: 'a iterator): string = ""
    | toString ts (Next (x, h)) = ts x ^ "; " ^ toString ts (h ())

  (* eq a_eq (it1,it2) ==> b
     ENSURES: b == true iff it1 and it2 contain the same values
              in the same order, values are compared by a_eq
   *)
  fun eq (_: 'a * 'a -> bool) (NoMore: 'a iterator, NoMore: 'a iterator): bool = true
    | eq a_eq (Next (x1,h1), Next (x2,h2)) = 
        a_eq (x1,x2) andalso eq a_eq (h1 (), h2 ())
    | eq _ _ = false

end (* structure Iterator *)
