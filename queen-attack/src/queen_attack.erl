-module(queen_attack).

-export([can_attack/2]).

can_attack({X, _}, {X, _}) -> true;
can_attack({_, Y}, {_, Y}) -> true;
can_attack({Wx, Wy}, {Bx, By}) when (abs(Wx - Bx) == abs(Wy - By)) -> true;
can_attack(_, _) -> false.
