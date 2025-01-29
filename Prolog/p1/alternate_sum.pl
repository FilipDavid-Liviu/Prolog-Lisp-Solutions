alternate_sum([], 0).
alternate_sum([H1, H2 | T], S):- !,
    alternate_sum(T, TS),
    S is H1 - H2 + TS.
alternate_sum([H | T], S):-
    alternate_sum(T, TS),
    S is H + TS.
