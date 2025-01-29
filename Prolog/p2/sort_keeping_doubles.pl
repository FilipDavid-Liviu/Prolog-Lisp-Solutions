sort_keeping_doubles([], []).
sort_keeping_doubles([H | T], SL) :-
    sort_keeping_doubles(T, R),
	insert(H, R, SL).

insert(X, [], [X]):- !.
insert(X, [H | T], [X, H | T]) :-
    X < H, !.
insert(X, [H | T], [H | TR]) :-
    insert(X, T, TR).

sort_keeping_doubles_heterogeneous([], []).
sort_keeping_doubles_heterogeneous([H | T], [SH | ST]) :-
    is_list(H), !,
    sort_keeping_doubles(H, SH),
    sort_keeping_doubles_heterogeneous(T, ST).
sort_keeping_doubles_heterogeneous([H | T], [H | ST]) :-
    sort_keeping_doubles_heterogeneous(T, ST).