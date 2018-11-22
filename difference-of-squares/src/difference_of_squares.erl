-module(difference_of_squares).

-export([sum_of_squares/1, square_of_sum/1, difference_of_squares/1, test_version/0]).

sum_of_squares(0) -> 0;
sum_of_squares(N) -> square(N) + sum_of_squares(N - 1).
square(N) -> N * N.

square_of_sum(N) -> square(sum(N)).
sum(0) -> 0;
sum(N) -> N + sum(N - 1).

difference_of_squares(N) -> square_of_sum(N) - sum_of_squares(N).

test_version() -> 1.
