-module(series).

-export([from_string/2, test_version/0]).

from_string(Width, String) -> from_string(Width, String, []).

from_string(_, "", Series) -> Series;
from_string(Width, String, Series) ->
  [_ | Tail] = String,
  case (string:length(String) < Width) of
    false -> from_string(Width, Tail, lists:append(Series, [string:sub_string(String, 1, Width)]));
    true -> Series
  end.

test_version() -> 1.
