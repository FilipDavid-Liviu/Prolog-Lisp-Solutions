is_mountain([H1, H2, H3 | T]):-
    is_mountain_flag([H1, H2, H3 | T], -1).

is_mountain_flag([H1, H2 | T], -1):-
    H1 < H2,
    is_mountain_flag([H2 | T], 0).
is_mountain_flag([H1, H2 | T], 0):-
    H1 < H2, !,
    is_mountain_flag([H2 | T], 0).
is_mountain_flag([H1, H2 | T], 0):-
    H1 > H2,
    is_mountain_flag([H2 | T], 1).
is_mountain_flag([H1, H2 | T], 1):-
    H1 > H2,
    is_mountain_flag([H2 | T], 1).
is_mountain_flag([_], 1).