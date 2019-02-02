-module(queen_attack).

-export([can_attack/2]).

can_attack(_WhiteX, _WhiteY, _BlackX, _BlackY)
  when (_WhiteX == _BlackX) -> true;
can_attack(_WhiteX, _WhiteY, _BlackX, _BlackY)
  when (_WhiteY == _BlackY) -> true;
can_attack(_WhiteX, _WhiteY, _BlackX, _BlackY)
  when (abs(_WhiteX - _BlackX) == abs(_WhiteY - _BlackY)) -> true;
can_attack(_, _, _, _) -> false.

can_attack({WhiteX, WhiteY}, {BlackX, BlackY}) ->
  can_attack(WhiteX, WhiteY, BlackX, BlackY).
