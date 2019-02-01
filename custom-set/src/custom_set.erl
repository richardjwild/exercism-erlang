-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2,
  union/2, test_version/0]).


add(_Elem, _Set) ->
  case (contains(_Elem, _Set)) of
    false -> lists:sort(_Set ++ [_Elem]);
    true -> _Set
  end.

contains(_Elem, _Set) -> lists:search(fun(T) -> T == _Elem end, _Set) == {value, _Elem}.

difference([], _) -> [];
difference(_Set1, []) -> lists:sort(_Set1);
difference(_Set1, _Set2) ->
  [_Elem | _Rest] = _Set2,
  case (contains(_Elem, _Set1)) of
    true -> difference(lists:delete(_Elem, _Set1), _Rest);
    false -> difference(_Set1, _Rest)
  end.

disjoint([], _) -> true;
disjoint(_, []) -> true;
disjoint(_Set1, _Set2) ->
  [_Elem | _Rest] = _Set1,
  case (contains(_Elem, _Set2)) of
    false -> disjoint(_Rest, _Set2);
    true -> false
  end.

empty(_Set) -> length(_Set) == 0.

equal([], []) -> true;
equal(_Set1, _Set2) -> subset(_Set1, _Set2) and subset(_Set2, _Set1).

from_list([], _Result) -> _Result;
from_list(_List, _Result) ->
  [_Elem | _Rest] = _List,
  from_list(_Rest, add(_Elem, _Result)).

from_list(_List) -> from_list(_List, []).

intersection([], _, _Result) -> _Result;
intersection(_Set1, _Set2, _Result) ->
  [_Elem | _Rest] = _Set1,
  case (contains(_Elem, _Set2)) of
    true -> intersection(_Rest, _Set2, _Result ++ [_Elem]);
    false -> intersection(_Rest, _Set2, _Result)
  end.

intersection([], _) -> [];
intersection(_, []) -> [];
intersection(_Set1, _Set2) -> intersection(_Set1, _Set2, []).

subset([], _) -> true;
subset(_Set1, _Set2) ->
  [_Elem | _Rest] = _Set1,
  case (contains(_Elem, _Set2)) of
    true -> subset(_Rest, _Set2);
    false -> false
  end.

union([], []) -> [];
union(_Set1, _Set2) -> from_list(lists:append(_Set1, _Set2)).

test_version() -> 2.
