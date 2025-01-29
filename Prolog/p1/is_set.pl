is_set([]).
is_set([H | T]):-
    \+ member(H, T),
    is_set(T).

member(X, [X | _]).
member(X, [_ | T]):-
    member(X, T).