substitute_element([], _, _, []).
substitute_element([E | T], E, New, [New | R]):- !,
    substitute_element(T, E, New, R).
substitute_element([H | T], E, New, [H | R]):-
    substitute_element(T, E, New, R).
