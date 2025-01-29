remove_consecutives([], []).
remove_consecutives([H], [H]):- !.
remove_consecutives([H1, H2, H3 | T], R):-
    H2 is H1 + 1,
    H3 is H2 + 1, !,
    remove_consecutives([H2, H3 | T], R).
remove_consecutives([H1, H2, H3 | T], R):-
    H2 is H1 + 1,
    \+ H3 is H2 + 1, !,
    remove_consecutives([H3 | T], R).
remove_consecutives([H1, H2 | T], [H1 | R]):-
    \+ H2 is H1 + 1, !,
    remove_consecutives([H2 | T], R).
remove_consecutives([H1, H2], []):-
    H2 is H1 + 1, !.
remove_consecutives([H1, H2], [H1, H2]).

remove_consecutives_all_sublists([], []).
remove_consecutives_all_sublists([H | T], [HR | TR]):-
    is_list(H), !,
    remove_consecutives(H, HR),
    remove_consecutives_all_sublists(T, TR).
remove_consecutives_all_sublists([H | T], [H | TR]):-
    remove_consecutives_all_sublists(T, TR).