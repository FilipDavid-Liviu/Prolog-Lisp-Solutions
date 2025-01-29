remove_repetitive([], []):- !.
remove_repetitive([H | T], R):-
    count_occurrences([H | T], H, Count),
    Count > 1, !,
    remove_all([H | T], H, RR),
    remove_repetitive(RR, R).
remove_repetitive([H | T], [H | R]):-
    remove_repetitive(T,  R).

count_occurrences([], _, 0):- !.
count_occurrences([E | T], E, Count):- !,
    count_occurrences(T, E, TCount),
    Count is TCount + 1.
count_occurrences([_ | T], E, Count):-
    count_occurrences(T, E, Count).

remove_all([], _, []).
remove_all([X | T], X, R):- !,
    remove_all(T, X, R).
remove_all([H | T], X, [H | R]):-
    remove_all(T, X, R).