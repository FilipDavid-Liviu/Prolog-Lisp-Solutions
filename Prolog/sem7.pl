sublist([], []).
sublist([_ | T], S) :-
    sublist(T, S).
sublist([H | T], [H | S]) :-
    sublist(T, S).

valid_sublist([H1, H2]) :-
    Diff is abs(H1 - H2),
    0 is Diff mod 3.
valid_sublist([H1, H2 | T]) :-
    Diff is abs(H1 - H2),
    0 is Diff mod 3,
    valid_sublist([H2 | T]).

valid_sublists(L, R) :-
    sublist(L, S),
    valid_sublist(S),
    R = S.

all_sublists(L, R) :-
    findall(S, valid_sublists(L, S), R).


insert(X, L, [X | L]).
insert(X, [H | T], [H | R]) :-
    insert(X, T, R).

permute([], []).
permute([H | T], P) :-
    permute(T, PT),
    insert(H, PT, P).