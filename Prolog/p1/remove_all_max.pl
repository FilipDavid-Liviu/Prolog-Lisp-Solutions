remove_all_max([], []):- !.
remove_all_max(L, R):-
    max_list(L, X),
    remove_all(L, X, R).

max_list([H], H):- !.
max_list([H | T], H):-
    max_list(T, Max),
    H > Max, !.
max_list([_ | T], Max):-
    max_list(T, Max).

remove_all([], _, []).
remove_all([X | T], X, R):- !,
    remove_all(T, X, R).
remove_all([H | T], X, [H | R]):-
    remove_all(T, X, R).