%flow (o)
all_predictions(P) :-
    findall(H, prediction2(H), P).

guess(1).
guess(2).
guess(x).

prediction([X1, X2, X3, X4]):-
    guess(X1),
    guess(X2),
    guess(X3),
    guess(X4),
    check([X1, X2, X3, X4]).

%checks that the last element is not 2 and the number of x's is less than or equal to 1
check([X1, X2, X3, X4]):-
    X4 \= 2,
    count([X1, X2, X3, X4], x, Nox),
    Nox =< 1.

%flow (i,i,o)
%count([l1,l2, ...], e) { 0, n = 0
%                         1 + count([l2, ...], e), l1 = e
%                         count([l2, ...], e), otherwise
count([], _, 0):-!.
count([X | T], X, N):-
    count(T, X, NT),
    N is NT + 1,!.
count([_|T], X, N):-
    count(T, X, N).

%a slightly more efficient version of the prediction function
%the value of the 4th prediction is generated according to requirements
guess4(1).
guess4(x).

prediction2([X1, X2, X3, X4]):-
    guess(X1),
    guess(X2),
    guess(X3),
    guess4(X4),
    check2([X1, X2, X3, X4]).

%checks only that the number of x's is less than or equal to 1
check2([X1, X2, X3, X4]):-
    count([X1, X2, X3, X4], x, Nox),
    Nox =< 1.