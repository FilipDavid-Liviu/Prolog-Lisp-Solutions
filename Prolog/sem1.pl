%mulk (L-list, K-numebr, R- result list)
%flow model (i, i, o)
mulk([], _, []).
mulk([H|T], K, R):-
     H1 is H*K,
     mulk(T, K, TR),
     R=[H1|TR].
%Append an element at the end of a list
app1([], K, [K]).
app1([H|T], K, [H|TR]):-
    app1(T, K, TR).
%Compute the sum of elements of a numerical list
sumlist([], 0).
sumlist([H|T], S):-
    sumlist(T, TS),
    S is H+TS.
%Compute the product of even elements in a numerical list
prodeven([], 1).
prodeven([H|T], P):-
    H mod 2 =\= 0,
    prodeven(T, P).
prodeven([H|T], P):-
    H mod 2 =:= 0,
    prodeven(T, TP),
    P is H*TP.
%Delete all increasing sequences
delincr([], []).
delincr([H1[]], [H1]).
delincr([H1|[H2]|[]], [H1|[H2]]):-
    H1 > H2

delincr([H1|H2], []).

delincr([H1|H2|H3|T], []).