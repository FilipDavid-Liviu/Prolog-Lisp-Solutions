substitute_element([], _, _, []).
substitute_element([E | T], E, New, [New | R]):- !,
    substitute_element(T, E, New, R).
substitute_element([H | T], E, New, [H | R]):-
    substitute_element(T, E, New, R).

max_list([H], H):- !.
max_list([H | T], H):-
    max_list(T, Max),
    H > Max, !.
max_list([_ | T], Max):-
    max_list(T, Max).

substitute_element_with_max(L, E, R):-
    max_list(L, Max),
    substitute_element(L, E, Max, R).

substitute_element_with_max_all_sublists([], _, []).
substitute_element_with_max_all_sublists([H | T], E, [R | RT]):-
    is_list(H), !,
    substitute_element_with_max_all_sublists(T, E, RT),
    substitute_element_with_max(H, E, R).
substitute_element_with_max_all_sublists([H | T], E, [H | R]):-
    substitute_element_with_max_all_sublists(T, E, R).