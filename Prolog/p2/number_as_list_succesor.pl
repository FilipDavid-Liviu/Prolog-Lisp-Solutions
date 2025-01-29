number_as_list_succesor(L, R):-
    reverse(L, Lr),
    number_as_list_succesor(Lr, 1, Rr),
	reverse(Rr, R).

number_as_list_succesor([], 0, []):- !.
number_as_list_succesor([], 1, [1]).
number_as_list_succesor([H | T], C, [RH | R]):- !,
    RH is (H + C) mod 10,
    NewC is (H + C) // 10,
    number_as_list_succesor(T, NewC, R).

reverse(L, R):-
    reverse(L, [], R).
reverse([], R, R).
reverse([H | T], A, R):-
    reverse(T, [H | A], R).

number_as_list_succesor_all_sublists([], []).
number_as_list_succesor_all_sublists([H | T], [R | RT]):-
    is_list(H), !,
    number_as_list_succesor_all_sublists(T, RT),
    number_as_list_succesor(H, R).
number_as_list_succesor_all_sublists([H | T], [H | R]):-
    number_as_list_succesor_all_sublists(T, R).

