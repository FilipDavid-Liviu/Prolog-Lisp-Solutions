remove_all([], _, []).
remove_all([X | T], X, R):- !,
    remove_all(T, X, R).
remove_all([H | T], X, [H | R]):-
    remove_all(T, X, R).
