-module(difference_of_squares).

-export([sum_of_squares/1, square_of_sum/1, difference_of_squares/1, test_version/0]).

sum_of_squares(0) -> 0;
sum_of_squares(N) -> (N * N) + sum_of_squares(N - 1).

square_of_sum(N) -> Sum = sum(N), Sum * Sum.

sum(0) -> 0;
sum(N) -> N + sum(N - 1).

difference_of_squares(N) -> square_of_sum(N) - sum_of_squares(N).

test_version() -> 1.
