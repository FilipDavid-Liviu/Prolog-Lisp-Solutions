insert_after_power_of_2(L, V, R):-
    insert_after_power_of_2_in(L, V, 1, 1, R).

insert_after_power_of_2_in([], _, _, _, []).
insert_after_power_of_2_in([H | T], V, P, P, [H, V | R]):- !,
    NextPos is P + 1,
    NextPower is P * 2,
    insert_after_power_of_2_in(T, V, NextPos, NextPower, R).
insert_after_power_of_2_in([H | T], V, Pos, Power, [H | R]):-
    NextPos is Pos + 1,
    insert_after_power_of_2_in(T, V, NextPos, Power, R).