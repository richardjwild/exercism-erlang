-module(darts).

-export([score/2]).

score(_R) when (_R =< 1.0) -> 10;
score(_R) when (_R =< 5.0) -> 5;
score(_R) when (_R =< 10.0) -> 1;
score(_) -> 0.

score(_X, _Y) ->
  Radius = math:sqrt((_X * _X) + (_Y * _Y)),
  score(Radius).
