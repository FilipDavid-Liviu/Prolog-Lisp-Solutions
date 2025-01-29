subset([], []).
subset([H | T], [H | NT]):-
    subset(T, NT).
subset([_ | T], NT):-
    subset(T, NT).

findall_subset(L, R):-
    findall(R, subset(L, R), R).



%comb(l1 l2 ... ln, k) = l1, if k = 1
%                     comb(l2...ln, k), if k >= 1
%                     l1 U comb(l2...ln, k-1), if k > 1

comb([H | _], 1, [H]).
comb([_ | T], K, R):-
    K >= 1,
    comb(T, K, R).
comb([H | T], K, [H | R]):-
    K > 1,
    K1 is K - 1,
    comb(T, K1, R).


%insert(E, l1 l2 ... ln) = E U l1 l2 ... ln, n >= 0
%                          l1 U insert(E, l2...ln), n > 0

insert(E, L, [E | L]).
insert(E, [H | T], [H | R]):-
    insert(E, T, R).


%perm(l1 l2 ... ln) = [], if n = 0
%                     insert(l1, perm(l2...ln)), if n > 0

perm([], []).
perm([H | T], R):-
    perm(T, RT),
    insert(H, RT, R).

%arrange(l1 l2 ... ln, k) = l1, if k = 1
%                     arrange(l2...ln, k), if k >= 1, n > 0
%                     insert(l1, arrange(l2...ln, k-1)), if k > 1, n > 0

arrange([H | _], 1, [H]).
arrange([_ | T], K, R):-
    K >= 1,
    arrange(T, K, R).
arrange([H | T], K, R):-
    K > 1,
    K1 is K - 1,
    arrange(T, K1, RT),
    insert(H, RT, R).






is_valley([H1, H2 | T]):-
    H1 > H2,
    is_valley_flag([H2 | T], 0).

is_valley_flag([H1, H2 | T], 0):-
    H1 > H2, !,
    is_valley_flag([H2 | T], 0).
is_valley_flag([H1, H2 | T], _):-
    H1 < H2, !,
    is_valley_flag([H2 | T], 1).
is_valley_flag([_], 1).


%create a subset, permute it, check if valley, return it in R
onesolution(L, P):-
    subset(L, SS),
    perm(SS, P),
    is_valley(P).

%find all solutions
all_valleys(L, R):-
    findall(P, onesolution(L, P), R).