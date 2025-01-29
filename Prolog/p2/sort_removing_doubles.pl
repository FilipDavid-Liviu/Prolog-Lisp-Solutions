sort_removing_doubles([], []).
sort_removing_doubles([H | T], SL) :-
    sort_removing_doubles(T, R),
	insert_not_present(H, R, SL).

insert_not_present(X, [], [X]):- !.
insert_not_present(X, [H | T], [X, H | T]) :-
    X < H, !.
insert_not_present(X, [H | T], [H | T]) :-
    X =:= H, !.
insert_not_present(X, [H | T], [H | TR]) :-
    insert_not_present(X, T, TR).

sort_removing_doubles_heterogeneous([], []).
sort_removing_doubles_heterogeneous([H | T], [SH | ST]) :-
    is_list(H), !,
    sort_removing_doubles(H, SH),
    sort_removing_doubles_heterogeneous(T, ST).
sort_removing_doubles_heterogeneous([H | T], [H | ST]) :-
    sort_removing_doubles_heterogeneous(T, ST).