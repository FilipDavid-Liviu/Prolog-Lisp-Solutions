insert_nth_position([], E, 1, [E]):- !.
insert_nth_position([], _, _, []).
insert_nth_position(L, E, N, [E | L]):-
    N =:= 1, !.
insert_nth_position([H | T], E, N, [H | R]):-
    NewN is N - 1,
    insert_nth_position(T, E, NewN, R).