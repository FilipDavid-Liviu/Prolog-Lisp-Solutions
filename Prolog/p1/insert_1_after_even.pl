insert_1_after_even([], []).
insert_1_after_even([H | T], [H, 1 | R]):- 
    0 is H mod 2, !,
    insert_1_after_even(T, R).
insert_1_after_even([H | T], [H | R]):- 
    insert_1_after_even(T, R).