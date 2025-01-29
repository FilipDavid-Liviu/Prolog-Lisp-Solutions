set_equality([], []).
set_equality([H | T], RS):-
    member(H, S), !,
    remove_el(S, H, RS),
    set_equality(T, RS).

member(X, [X | _]).
member(X, [_ | T]):-
    member(X, T).

remove_el([], _, []).
remove_el([X | T], X, T):- !.
remove_el([H | T], X, [H | R]):-
    remove_el(T, X, R).