divisor_list(E, L):-
    divisor_list(E, 2, L).
divisor_list(E, D, []):-
    D >= E, !.
divisor_list(E, D, [D | L]):-
    0 is E mod D, !,
    NewD is D + 1,
    divisor_list(E, NewD, L).
divisor_list(E, D, L):-
    NewD is D + 1,
    divisor_list(E, NewD, L).

append([], L, L).
append([H | T], L, [H | R]):-
    append(T, L, R).

insert_divisors([], []).
insert_divisors([H | T], [H | R]):-
    insert_divisors(T, RT),
    divisor_list(H, L),
    append(L, RT, R).

insert_divisors_all_sublists([], []).
insert_divisors_all_sublists([H | T], [NewH | RT]):-
    is_list(H), !,
    insert_divisors(H, NewH),
    insert_divisors_all_sublists(T, RT).
insert_divisors_all_sublists([H | T], [H | R]):-
    insert_divisors_all_sublists(T, R).