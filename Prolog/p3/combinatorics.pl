sublist([], []).
sublist([H | T], [H | S]) :-
    sublist(T, S).
sublist([_ | T], S) :-
    sublist(T, S).

insert(X, L, [X | L]).
insert(X, [H | T], [H | R]) :-
    insert(X, T, R).

permute([], []).
permute([H | T], P) :-
    permute(T, PT),
    insert(H, PT, P).

arrangement(L, K, R) :-
    sublist(L, S),
    length(S, K),
    permute(S, R).

combination(L, K, R) :-
    sublist(L, S),
    length(S, K).
%%
arrangement([H | _], 1, [H]).
arrangement([H | T], K, R1) :-
    K > 1,
    K1 is K - 1,
    arrangement(T, K1, R),
    insert(H, R, R1).
arrangement([_ | T], K, R) :-
    arrangement(T, K, R).

combination([H | _], 1, [H]).
combination([H | T], K, [H | R]) :-
    K > 1,
    K1 is K - 1,
    combination(T, K1, R).
combination([_ | T], K, R) :-
    combination(T, K, R).

length([], 0).
length([_ | T], N) :-
    length(T, N1),
    N is N1 + 1.