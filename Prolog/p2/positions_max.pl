positions_max([H | T], R) :-
    positions_max(T, H, [1], 2, R).
positions_max([], _, PosL, _, PosL).
positions_max([H | T], Max, _, I, R) :-
    H > Max, !,
    NewI is I + 1,  
    positions_max(T, H, [I], NewI, R).
positions_max([H | T], Max, PosL, I, R) :-
    H =:= Max, !,
    NewI is I + 1,
    append(PosL, [I], NewPosL),
    positions_max(T, Max, NewPosL, NewI, R).
positions_max([_ | T], Max, PosL, I, R) :-
    NewI is I + 1,
    positions_max(T, Max, PosL, NewI, R).

append([], L, L).
append([H | T], L, [H | R]):-
    append(T, L, R).

replace_sublists_positions_max([], []).
replace_sublists_positions_max([H | T], [R | RT]):-
    is_list(H), !,
    positions_max(H, R),
    replace_sublists_positions_max(T, RT).
replace_sublists_positions_max([H | T], [H | R]):-
    replace_sublists_positions_max(T, R).
