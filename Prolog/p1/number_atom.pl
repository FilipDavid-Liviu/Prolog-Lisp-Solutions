number_atom([], _):- !.
number_atom([H | T], R):-
    number_atom(T, RT),
	update_count(H, RT, R).

update_count(A, [], [[A, 1]]):- !.
update_count(A, [[A, Count] | T], [[A, NewCount] | T]):- !,
    NewCount is Count + 1.
update_count(A, [H | T], [H | R]):-
    update_count(A, T, R).