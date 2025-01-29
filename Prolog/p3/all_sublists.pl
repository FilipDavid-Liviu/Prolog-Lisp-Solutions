sublist([], []).
sublist([_ | T], S) :-
    sublist(T, S).
sublist([H | T], [H | S]) :-
    sublist(T, S).

all_sublists(L, R) :-
    findall(S, sublist(L, S), R).