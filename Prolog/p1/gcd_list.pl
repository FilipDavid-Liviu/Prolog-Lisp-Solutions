gcd_list([X], X):- !.
gcd_list([H | T], GCD):-
    gcd_list(T, TGCD),
    greatest_common_divisor(H, TGCD, GCD).

greatest_common_divisor(X, 0, X):- !.
greatest_common_divisor(X, Y, GCD):-
    Y > 0,
    R is X mod Y,
    greatest_common_divisor(Y, R, GCD).