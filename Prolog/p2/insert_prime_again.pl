insert_prime_again([], []).
insert_prime_again([H | T], [H, H |T1]) :-
    is_prime(H), !,
    insert_prime_again(T, T1).
insert_prime_again([H | T], [H | T1]) :-
    insert_prime_again(T, T1).

is_prime(2) :- !.
is_prime(N) :-
    N > 2,
    N mod 2 =\= 0,
    \+ has_divisor(N, 3).
has_divisor(N, D) :-
    D * D =< N,
    0 is N mod D, !.
has_divisor(N, D) :-
    D * D =< N,
    D2 is D + 2,
    has_divisor(N, D2).

insert_prime_again_all_sublists([], []).
insert_prime_again_all_sublists([H | T], [R | RT]):-
    is_list(H), !,
    insert_prime_again_all_sublists(T, RT),
    insert_prime_again(H, R).
insert_prime_again_all_sublists([H | T], [H | R]):-
    insert_prime_again_all_sublists(T, R).