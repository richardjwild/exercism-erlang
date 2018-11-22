-module(triangle).

-export([kind/3, test_version/0]).

kind(A, B, C) ->
  case validate(A, B, C) of
    positive_lengths -> {error, "all side lengths must be positive"};
    inequality -> {error, "side lengths violate triangle inequality"};
    valid -> valid_triangle(sets:size(sets:from_list([A, B, C])))
  end.

validate(A, B, C) when ((A =< 0) or (B =< 0) or (C =< 0)) -> positive_lengths;
validate(A, B, C) -> check_inequality(lists:sort([A, B, C])).

check_inequality([A, B, C]) when (C < (A + B)) -> valid;
check_inequality([_, _, _]) -> inequality.

valid_triangle(3) -> scalene;
valid_triangle(2) -> isosceles;
valid_triangle(1) -> equilateral.

test_version() -> 1.
