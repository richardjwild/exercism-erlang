-module( series_tests ).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").

one_test() -> ?assert( series:from_string(1, "ABCD") =:= ["A", "B", "C", "D"]).

three_test() -> ?assert( series:from_string(3, "01234") =:= ["012", "123", "234"] ).

four_test() -> ?assert( series:from_string(4, "01234") =:= ["0123", "1234"] ).

two_wide_test() -> ?assert( series:from_string(5, "ABCD") =:= []).

version_test() ->
  ?assertMatch(1, series:test_version()).
