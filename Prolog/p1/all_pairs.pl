all_pairs([], []).
all_pairs([_], []):- !.
all_pairs([H | T], R):-
    make_pairs(H, T, Pairs),
    all_pairs(T, TPairs),
    append_sets(Pairs, TPairs, R).

make_pairs(_, [], []):- !.
make_pairs(X, [H | T], [[X, H] | R]):-
    make_pairs(X, T, R).

append_sets([], S, S).
append_sets([H | T], S, R):-
    member(H, S), !,
    append_sets(T, S, R).
append_sets([H | T], S, [H | R]):-
    append_sets(T, S, R).

member(X, [X | _]).
member(X, [_ | T]):-
    member(X, T).