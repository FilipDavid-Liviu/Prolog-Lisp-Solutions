set_union([], S, S).
set_union([H | T], S, R):-
    member(H, S), !,
    set_union(T, S, R).
set_union([H | T], S, [H | R]):-
    set_union(T, S, R).

member(X, [X | _]).
member(X, [_ | T]):-
    member(X, T).