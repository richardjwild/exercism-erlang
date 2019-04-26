%%%-------------------------------------------------------------------
%%% @author richardwild
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Apr 2019 12:15
%%%-------------------------------------------------------------------
-module(tennis_kata).
-author("richardwild").

%% API
-compile(export_all).

start() -> {love, love}.

won_point(player1, {thirty, forty}) -> {deuce};
won_point(player2, {forty, thirty}) -> {deuce};
won_point(player1, {_previous_player_1_score, _previous_player_2_score}) ->
  {increase_score(_previous_player_1_score), _previous_player_2_score};
won_point(player2, {_previous_player_1_score, _previous_player_2_score}) ->
  {_previous_player_1_score, increase_score(_previous_player_2_score)}.

increase_score(love) -> fifteen;
increase_score(fifteen) -> thirty;
increase_score(thirty) -> forty.
