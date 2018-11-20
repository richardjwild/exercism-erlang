-module(leap).

-export([leap_year/1, test_version/0]).


leap_year(_Year) ->
  if
    (_Year rem 4 /= 0) -> false;
    ((_Year rem 100 == 0) andalso (_Year rem 400 /= 0)) -> false;
    true -> true
  end.

test_version() -> 4.
