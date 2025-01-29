merge_lists_remove_doubles(L1, L2, R):-
    remove_doubles(L1, S1),
    remove_doubles(L2, S2),
    merge_sorted(S1, S2, R).

merge_sorted([], [], []):- !.
merge_sorted([], S2, S2):- !.
merge_sorted(S1, [], S1):- !.
merge_sorted([H1 | T1], [H2 | T2], [H1 | R]) :-
    H1 < H2, !,
    merge_sorted(T1, [H2 | T2], R).
merge_sorted([H1 | T1], [H2 | T2], [H2 | R]) :-
    H1 > H2, !,
    merge_sorted([H1 | T1], T2, R).
merge_sorted([H | T1], [H | T2], [H | R]) :-
    merge_sorted(T1, T2, R).

remove_doubles([], []).
remove_doubles([H], [H]):- !.
remove_doubles([H, H | T], R):- !,
    remove_doubles([H | T], R).
remove_doubles([H1, H2 | T], [H1 | R]):-
    remove_doubles([H2 | T], R).


merge_lists_remove_doubles_all_sublists([], []).
merge_lists_remove_doubles_all_sublists([H | T], R):-
    is_list(H), !,
    merge_lists_remove_doubles_all_sublists(T, RT),
    merge_lists_remove_doubles(H, RT, R).
merge_lists_remove_doubles_all_sublists([_ | T], R):-
    merge_lists_remove_doubles_all_sublists(T, R).