set_difference([], _, []).
set_difference([H | T], S, R):-
    member(H, S), !,
    set_difference(T, S, R).
set_difference([H | T], S, [H | R]):-
    set_difference(T, S, R).

member(X, [X | _]).
member(X, [_ | T]):-
    member(X, T).