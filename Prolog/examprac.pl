f(1,1) :- !.
f(K, X) :- K1 is K - 1, f(K1, Y), Y > 1, !, K2 is K1 - 1, X is K2.
f(K, X) :- K1 is K - 1, f(K1, Y), Y > 0.5, !, X is Y.
f(K, X) :- K1 is K - 1, f(K1, X), X is Y - 1.

f(1,1) :- !.
f(K, X) :- K1 is K - 1, f(K1, Y), aux(K1, Y, X).

aux(K1, Y, K2) :- Y > 1, !, K2 is K1 - 1.
aux(_, Y, Y) :- Y > 0.5, !.
aux(_, Y, X) :- X is Y - 1.

f([], -1).
f([H|T], S):-
    H > 0,
    f(T, S1),
    S1 < H, !,
    S is H.
f([_|T], S):-
    f(T, S1),
    S is S1.

f([], -1).
f([H | T], S):-
    f(T, S1),
    aux(S1, H, S).
aux(S1, H, H):-
    H > 0,
    S1 < H, !.
aux(S, H, S).

%%All decomposition of N
decomp(N, SP) :-
    N1 is N - 1,
    generate_list(N1, L),
    sublist(L, S),
    sum_list(S, Sum),
    N is Sum,
    permute(S, SP).

sum_list([], 0).
sum_list([H | T], S) :-
    sum_list(T, S1),
    S is S1 + H.
generate_list(0, []).
generate_list(N, [N | T]) :-
    N > 0,
    N1 is N - 1,
    generate_list(N1, T).

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



is_prime(2):-!.
is_prime (X):-
    X mod 2 =:= 1,
    X > 1,
    is_prime_aux (X, 3).

is_prime_aux (X, I):-
    I * I > X,
    !.
is_prime_aux (X, I):-
    X mod I =\= 0,
    I1 is I + 2,
    is_prime aux (X, I1).

candidates (N, N):-
    is_prime (N).
candidates (N, E):-
    N > 1,
    N1 is N - 1,
    candidates (N1, E).

generate (N, R):-
    candidates (N, E),
    generate_aux (N, E, [E], R).

generate_aux (N, N, C, C):-!.
generate_aux (N, S, [H | T], R):- 
    candidates (N, E),
    E < H,
    S1 is S + E,
    S1 =< N,
    generate_aux(N, S1, [E, H | T], R).

length([], 0).
length([_ | T], L):-
    length(T, L1),
    L is L1 + 1.
