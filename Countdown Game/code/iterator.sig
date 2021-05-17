signature ITERATOR =
sig
  datatype 'a iterator = NoMore
                       | Next of 'a * (unit -> 'a iterator)

  val toString: ('a -> string) -> 'a iterator -> string
  val eq: ('a * 'a -> bool) -> 'a iterator * 'a iterator -> bool

  val fromList: 'a list -> 'a iterator
  val toList: 'a iterator -> 'a list

  val concat: 'a iterator iterator -> 'a iterator
  val cartesian: 'a iterator * 'b iterator -> ('a * 'b) iterator

  val any: 'a iterator -> 'a option
  val all: 'a iterator -> 'a list

  val some: ( 'a -> bool) -> 'a iterator -> 'a option
  val map: ('a -> 'b) -> 'a iterator -> 'b iterator
  val filter: ('a -> bool) -> 'a iterator -> 'a iterator
end (* signature ITERATOR *)
