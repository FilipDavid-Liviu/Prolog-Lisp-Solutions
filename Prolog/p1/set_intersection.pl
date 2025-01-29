set_intersection([], _, []).
set_intersection([H | T], S, [H | R]):-
    member(H, S), !,
    set_intersection(T, S, R).
set_intersection([_ | T], S, R):-
    set_intersection(T, S, R).

member(X, [X | _]).
member(X, [_ | T]):-
    member(X, T).