remove_nth([], _, []).
remove_nth([_ | T], N, T):-
    N =:= 1, !.
remove_nth([H | T], N, [H | R]):-
    NewN is N - 1,
    remove_nth(T, NewN, R).