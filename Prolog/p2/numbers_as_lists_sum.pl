numbers_as_lists_sum(L1, L2, R):-
    reverse(L1, L1r),
    reverse(L2, L2r),
    numbers_as_lists_sum(L1r, L2r, 0, Rr),
	reverse(Rr, R).

numbers_as_lists_sum([], [], 0, []):- !.
numbers_as_lists_sum([], [], 1, [1]).
numbers_as_lists_sum([H1 | T1], [], C, [RH | R]):- !,
    RH is (H1 + C) mod 10,
    NewC is (H1 + C) // 10,
    numbers_as_lists_sum(T1, [], NewC, R).
numbers_as_lists_sum([], [H2 | T2], C, [RH | R]):- !,
    RH is (H2 + C) mod 10,
    NewC is (H2 + C) // 10,
    numbers_as_lists_sum([], T2, NewC, R).
numbers_as_lists_sum([H1 | T1], [H2 | T2], C, [RH | R]):-
    RH is (H1 + H2 + C) mod 10,
    NewC is (H1 + H2 + C) // 10,
    numbers_as_lists_sum(T1, T2, NewC, R).

reverse(L, R):-
    reverse(L, [], R).
reverse([], R, R).
reverse([H | T], A, R):-
    reverse(T, [H | A], R).

numbers_as_lists_sum_all_sublists([], []).
numbers_as_lists_sum_all_sublists([H | T], R):-
    is_list(H), !,
    numbers_as_lists_sum_all_sublists(T, RT),
    numbers_as_lists_sum(H, RT, R).
numbers_as_lists_sum_all_sublists([_ | T], R):-
    numbers_as_lists_sum_all_sublists(T, R).
