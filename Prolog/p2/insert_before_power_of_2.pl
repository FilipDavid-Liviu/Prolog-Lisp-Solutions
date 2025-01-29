insert_before_power_of_2(L, V, R):-
    insert_before_power_of_2_in(L, V, 1, 1, R).

insert_before_power_of_2_in([], _, _, _, []).
insert_before_power_of_2_in([H | T], V, P, P, [H, V | R]):- !,
    NextPos is P + 1,
    NextPower is (P + 1) * 2 - 1,
    insert_before_power_of_2_in(T, V, NextPos, NextPower, R).
insert_before_power_of_2_in([H | T], V, Pos, Power, [H | R]):-
    NextPos is Pos + 1,
    insert_before_power_of_2_in(T, V, NextPos, Power, R).


insert_before_power_of_2_all_sublists(L, R):-
    insert_before_power_of_2_all_sublists(L, _, R).
insert_before_power_of_2_all_sublists([], _, []).
insert_before_power_of_2_all_sublists([H | T], E, [R | RT]):-
    is_list(H), !,
    insert_before_power_of_2_all_sublists(T, E, RT),
    insert_before_power_of_2(H, E, R).
insert_before_power_of_2_all_sublists([H | T], _, [H | R]):-
    NewE is H,
    insert_before_power_of_2_all_sublists(T, NewE, R).