number_as_list_product_digit(L, D, R):-
    reverse(L, Lr),
    number_as_list_product_digit(Lr, D, 0, Rr),
	reverse(Rr, R).

number_as_list_product_digit([], _, 0, []):- !.
number_as_list_product_digit([], _, 1, [1]).
number_as_list_product_digit([H1 | T1], D, C, [RH | R]):-
    RH is (H1 * D + C) mod 10,
    NewC is (H1 * D + C) // 10,
    number_as_list_product_digit(T1, D, NewC, R).

reverse(L, R):-
    reverse(L, [], R).
reverse([], R, R).
reverse([H | T], A, R):-
    reverse(T, [H | A], R).
