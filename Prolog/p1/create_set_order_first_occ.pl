create_set_order_first_occ(L, R) :-
    create_set_order_first_occ_acc(L, [], R).

create_set_order_first_occ_acc([], _, []).
create_set_order_first_occ_acc([H | T], Seen, [H | R]) :-
    \+ member(H, Seen), !,
    create_set_order_first_occ_acc(T, [H | Seen], R).
create_set_order_first_occ_acc([_ | T], Seen, R) :-
    create_set_order_first_occ_acc(T, Seen, R).

member(X, [X | _]).
member(X, [_ | T]):-
    member(X, T).