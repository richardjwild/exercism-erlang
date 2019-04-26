-module(tennis_kata_tests).

-include_lib("eunit/include/eunit.hrl").

%%play([_winner_of_point | _Rest]) ->
%%  tennis_kata:won_point(_winner_of_point, tennis_kata:start());
play([_winner_of_point | []], _score) ->
  tennis_kata:won_point(_winner_of_point, _score);
play([_winner_of_point | _Rest], _score) ->
  _NewScore = tennis_kata:won_point(_winner_of_point, _score),
  play(_Rest, _NewScore).

new_game_test() -> ?assertEqual({love, love}, tennis_kata:start()).

player1_won_first_point_test() -> ?assertEqual(
  {fifteen, love},
  tennis_kata:won_point(player1, tennis_kata:start())).

player2_won_first_point_test() -> ?assertEqual(
  {love, fifteen},
  tennis_kata:won_point(player2, tennis_kata:start())).

player1_won_two_points_test() -> ?assertEqual(
  {thirty, love},
  tennis_kata:won_point(player1, tennis_kata:won_point(player1, tennis_kata:start()))).

player2_won_two_points_test() -> ?assertEqual(
  {love, thirty},
  tennis_kata:won_point(player2, tennis_kata:won_point(player2, tennis_kata:start()))).

player1_won_three_points_test() -> ?assertEqual(
  {forty, love},
  tennis_kata:won_point(player1, tennis_kata:won_point(player1, tennis_kata:won_point(player1, tennis_kata:start())))).

deuce_test() -> ?assertEqual(
  {deuce},
  play([player1, player1, player2, player2, player2, player1], tennis_kata:start())).

deuce_other_test() -> ?assertEqual(
  {deuce},
  play([player1, player1, player2, player2, player1, player2], tennis_kata:start())).



