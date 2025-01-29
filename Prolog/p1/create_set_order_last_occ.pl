create_set_order_last_occ([], []).
create_set_order_last_occ([H | T], [H | R]):-
    \+ member(H, T), !,
    create_set_order_last_occ(T, R).
create_set_order_last_occ([_ | T], R):-
    create_set_order_last_occ(T, R).

member(X, [X | _]).
member(X, [_ | T]):-
    member(X, T).