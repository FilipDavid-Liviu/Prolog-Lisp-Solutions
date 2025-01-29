number_as_list_predecessor(L, RF):-
    reverse(L, Lr),
    number_as_list_predecessor(Lr, -1, Rr),
	reverse(Rr, R),
    cut_head(R, RF).

number_as_list_predecessor([], 0, []):- !.
number_as_list_predecessor([], -1, [9]).
number_as_list_predecessor([H | T], C, [RH | R]):-
    RH is (H + C + 10) mod 10,
    0 > (H + C), !,
    NewC is -1,
    number_as_list_predecessor(T, NewC, R).
number_as_list_predecessor([H | T], C, [RH | R]):- !,
    RH is (H + C + 10) mod 10,
    NewC is 0,
    number_as_list_predecessor(T, NewC, R).

reverse(L, R):-
    reverse(L, [], R).
reverse([], R, R).
reverse([H | T], A, R):-
    reverse(T, [H | A], R).

cut_head([H | T],R):-
    H = 0, !,
    cut_head(T,R).
cut_head(L,L).

number_as_list_predecessor_all_sublists([], []).
number_as_list_predecessor_all_sublists([H | T], [R | RT]):-
    is_list(H), !,
    number_as_list_predecessor_all_sublists(T, RT),
    number_as_list_predecessor(H, R).
number_as_list_predecessor_all_sublists([H | T], [H | R]):-
    number_as_list_predecessor_all_sublists(T, R).
