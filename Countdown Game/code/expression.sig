signature EXPRESSION =
sig
  type 'a operation = string * ('a * 'a -> 'a)
  datatype 'a exp = Val of 'a
  		  | Op of 'a operation * 'a exp * 'a exp

  val toString: ('a -> string) -> 'a exp -> string
  val eq: ('a * 'a -> bool) -> 'a exp * 'a exp -> bool
  val eval: 'a exp -> 'a
end (* signature EXPRESSION *)
