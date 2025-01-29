%sum when called back
suma([], 0).
suma([H|T], R):-
    suma(T, TR),
    R is H+TR.


%sum when going in
%flow model(i, i, o)
sumc([], C, C).
sumc([H|T], C, S):-
    NewC is C+H,
    sumc(T, NewC, S).

mainSumc(L, S):- sumc(L, 0, S).



%number of occurences of a number in a list
nOc([], _, 0).
nOc([E|T], E, R):-!,
    nOc(T, E, R1),
    R is R1 + 1.
nOc([_|T], E, R):-
    nOc(T, E, R).

%number of occurences of a number in a list collector
nOcC([], _, C, C).
nOcC([E|T], E, C, R):-!,
    NewC is C+1,
    nOcC(T, E, NewC, R).
nOcC([_|T], E, C, R):-
    nOcC(T, E, C, R).

mainnOcC(L, E, R):- nOcC(L, E, 0, R).

%remove elements which appear only once
rmAppear1([], _, []).
rmAppear1([H|T], C, R):-
    nOc(C, H, N),
    N > 1, !,
    rmAppear1(T, C, R1),
    R = H|R1.
rmAppear1([_|T], C, R):-
    rmAppear1(T, C, R).

mainrm(L, R):-rmAppear1(L, L, R).

rmAppear1([], _, C, C).
rmAppear1([H|T], CP, C, R):-
    nOc(CP, H, 1),!,
    rmAppear1(T, CP, C, R1),
rmAppear1([H|T], C, R):-
    nOc(CP, H, N),
    N > 1,
    add_end(C, H, R)
    rmAppear1(T, CP, C, R).

mainrmC(L, R):-rmAppear1C(L, L, [], R).


%greatest common divisor of all elems in a list

gcd