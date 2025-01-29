remove_first_min([], []):- !.
remove_first_min(L, R):-
    min_list(L, X),
    remove_el(L, X, R).

min_list([H], H):- !.
min_list([H | T], H):-
    min_list(T, Min),
    H < Min, !.
min_list([_ | T], Min):-
    min_list(T, Min).

remove_el([], _, []).
remove_el([X | T], X, T):- !.
remove_el([H | T], X, [H | R]):-
    remove_el(T, X, R).