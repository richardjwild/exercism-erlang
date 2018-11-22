-module(triangle).

-export([kind/3, test_version/0]).

kind(A, B, C) ->
  case validate(A, B, C) of
    positive_lengths -> {error, "all side lengths must be positive"};
    inequality -> {error, "side lengths violate triangle inequality"};
    good -> count_different_sides(sets:size(sets:from_list([A, B, C])))
  end.

count_different_sides(3) -> scalene;
count_different_sides(2) -> isosceles;
count_different_sides(1) -> equilateral.

validate(A, B, C) when ((A =< 0) or (B =< 0) or (C =< 0)) -> positive_lengths;
validate(A, B, C) ->
  SortedSides = lists:reverse(lists:sort([A, B, C])),
  LargerSide = lists:nth(1, SortedSides),
  SumOfSmallerTwoSides = lists:sum(lists:nthtail(1, SortedSides)),
  if (SumOfSmallerTwoSides =< LargerSide) -> inequality;
    true -> good
  end.

test_version() -> 1.
