remove_first_three_occurences(L, X, R):-
    remove_el(L, X, R1),
    remove_el(R1, X, R2),
    remove_el(R2, X, R).

remove_el([], _, []).
remove_el([X | T], X, T):- !.
remove_el([H | T], X, [H | R]):-
    remove_el(T, X, R).