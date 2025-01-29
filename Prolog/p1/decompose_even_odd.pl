%flow (i, o, o, o)
decompose_even_odd(L, R, EvenCount, OddCount):-
    decompose_even_odd_acc(L, Evens, Odds, EvenCount, OddCount),
    append(Evens, Odds, R).

decompose_even_odd_acc([], [], [], 0, 0).
decompose_even_odd_acc([H | T], [H | Evens], Odds, NewEvenCount, OddCount):-
    0 is H mod 2, !,
    decompose_even_odd_acc(T, Evens, Odds, EvenCount, OddCount),
    NewEvenCount is EvenCount + 1.
decompose_even_odd_acc([H | T], Evens, [H | Odds], EvenCount, NewOddCount):-
    decompose_even_odd_acc(T, Evens, Odds, EvenCount, OddCount),
    NewOddCount is OddCount + 1.

append([], L, L).
append([H | T], L, [H | R]):-
    append(T, L, R).