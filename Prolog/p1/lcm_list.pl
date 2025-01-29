lcm_list([X], X):- !.
lcm_list([H | T], LCM):-
    lcm_list(T, TLCM),
    lowest_common_multiple(H, TLCM, LCM).

lowest_common_multiple(0, 0, 0):- !.
lowest_common_multiple(X, Y, LCM):-
    greatest_common_divisor(X, Y, GCD),
    LCM is (X * Y) // GCD.

greatest_common_divisor(X, 0, X):- !.
greatest_common_divisor(X, Y, GCD):-
    Y > 0,
    R is X mod Y,
    greatest_common_divisor(Y, R, GCD).